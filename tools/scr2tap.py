import os
import sys
from struct import pack

def to_tap(input_file, output_file):
    # Load the screen file into memory
    with open(input_file, 'rb') as file:
        screen = file.read()

    # Extract the base name and prepare the header
    head = os.path.basename(input_file).replace(os.path.splitext(input_file)[1], "").ljust(10)[:10]

    # Initialize header block
    bytes_list = []

    # Add header block length (Little Endian, 0x13, 0x00), flag (0x00), and block type (0x03)
    bytes_list.extend([0x13, 0x00, 0x00, 0x03])

    # Add header name (padded to 10 characters)
    bytes_list.extend([ord(c) for c in head])

    # Add screen length in Little Endian (6192)
    bytes_list.extend([0x00, 0x1b])

    # Add parameter 1 (16384 in Little Endian)
    bytes_list.extend([0x00, 0x40])

    # Add parameter 2 (32768 in Little Endian)
    bytes_list.extend([0x00, 0x80])

    # Calculate and add checksum for the header block
    checksum = 0x00
    for byte in bytes_list[2:]:
        checksum ^= byte
    bytes_list.append(checksum)

    # Add screen block length (Little Endian, 6192 + 2 bytes)
    bytes_list.extend([0x02, 0x1b])

    # Add screen block flag (0xFF)
    bytes_list.append(0xFF)

    # Add screen bytes
    bytes_list.extend(screen)

    # Calculate and add checksum for the screen block
    checksum = 0xFF
    for byte in screen:
        checksum ^= byte
    bytes_list.append(checksum)

    # Write the output file
    with open(output_file, 'wb') as file:
        file.write(bytearray(bytes_list))

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    if not os.path.isfile(input_file):
        print(f"Error: File {input_file} does not exist.")
        sys.exit(1)

    # Run the conversion
    to_tap(input_file, output_file)
    print(f"Success: File {output_file} has been created.")