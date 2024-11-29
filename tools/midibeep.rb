require 'midilib'

# midibeep.rb: Convert a Standard MIDI (.mid) file into Spectrum BEEP statements
# Updated to modern Ruby syntax

MIN_NOTE_LENGTH = 20_000 # Minimum number of microseconds each note must be played for
LINE_NUMBER_INCREMENT = 5

# Create a new, empty sequence
seq = MIDI::Sequence.new

# Utility class to merge several Enumerables into one ordered Enumerable
class IteratorMerger
	include Enumerable
  
	def initialize
	  @streams = []
	end
  
	def add(enumerable)
	  @streams << enumerable.to_enum
	end
  
	def each
	  loop do
		# Remove streams that have finished
		@streams.reject! { |stream| stream.peek rescue nil; false rescue StopIteration }
		break if @streams.empty?
  
		# Find the stream with the smallest next item
		next_stream = @streams.min_by { |stream| stream.peek rescue Float::INFINITY }
		yield next_stream.next
	  end
	end
  end

# Customize MIDI::Event ordering
class MIDI::Event
  def <=>(other)
    comparator = [time_from_start, (is_a?(MIDI::NoteEvent) ? note : -1)]
    other_comparator = [other.time_from_start, (other.is_a?(MIDI::NoteEvent) ? other.note : -1)]
    comparator <=> other_comparator
  end
end

# Main processing
File.open(ARGV[0], 'rb') do |file|
  event_stream = IteratorMerger.new

  seq.read(file) do |track, _num_tracks, _i|
    next unless track

    event_stream.add(track.events)
  end

  last_tempo_event_time = 0
  default_bpm = MIDI::Sequence::DEFAULT_TEMPO
  microseconds_per_beat = MIDI::Tempo.bpm_to_mpq(default_bpm)
  last_tempo_event = MIDI::Tempo.new(microseconds_per_beat)

  last_note_on_event = nil
  last_note_on_time = 0
  overshoot = 0

  line_number = LINE_NUMBER_INCREMENT

  add_beep = lambda do |end_time|
    real_duration = end_time - last_note_on_time
    target_duration = real_duration - overshoot
    actual_duration = [target_duration, MIN_NOTE_LENGTH].max
    overshoot = actual_duration - target_duration
    pitch = last_note_on_event.note - 48
    puts "BEEP #{actual_duration / 1_000_000.0},#{pitch}"
    line_number += LINE_NUMBER_INCREMENT
  end

  event_stream.each do |event|
    delta_time = event.time_from_start - last_tempo_event.time_from_start
    microseconds_since_tempo = delta_time * last_tempo_event.tempo / seq.ppqn
    current_time = last_tempo_event_time + microseconds_since_tempo

    case event
    when MIDI::Tempo
      last_tempo_event = event
      last_tempo_event_time = current_time
    when MIDI::NoteOnEvent
      add_beep.call(current_time) if last_note_on_event
      last_note_on_event = event
      last_note_on_time = current_time
    when MIDI::NoteOffEvent
      next
    end
  end

  add_beep.call(last_note_on_time) if last_note_on_event
end
