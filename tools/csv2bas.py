import csv
import os
import sys

# Map of input values to corresponding mapped values
value_map = {
    17: 0, 15: 1, 16: 2, 0: 3, 1: 4, 2: 5, 3: 6, 4: 7, 5: 8,
    6: 9, 7: 10, 8: 11, 9: 12, 10: 13, 11: 14, 12: 15, 13: 16, 14: 17, 18: 18
}

# Function to process and convert _Scene.csv to BASIC format
def process_scene_file(input_prefix, output_dir):
    input_csv = f"{input_prefix}_Scene.csv"
    output_bas = os.path.join(output_dir, f"{os.path.basename(input_prefix)}_Scene.bas")

    if not os.path.exists(input_csv):
        print(f"File {input_csv} not found.")
        return

    print(f"Processing file: {input_csv}")

    with open(input_csv, 'r') as csv_file:
        reader = csv.reader(csv_file)
        data = [[int(value) for value in row] for row in reader]
        
    # Map values using value_map and prepare BASIC format
    bas_data = [
        [value_map[value] for value in row] for row in data
    ]
    
    with open(output_bas, 'w') as bas_file:
        bas_file.write(f"DIM {os.path.basename(input_prefix)}Data(")
        bas_file.write(f"{len(bas_data)-1},{len(bas_data[0])-1}) AS UBYTE => {{ _\n")
        for i, row in enumerate(bas_data):
            if i == len(bas_data) - 1:
                bas_file.write("{" + ",".join(f"{value:02}" for value in row) + "}_\n")
            else:
                bas_file.write("{" + ",".join(f"{value:02}" for value in row) + "},_\n")
        bas_file.write("}\n")
    
    print(f"File {output_bas} created.")

# Function to process and convert _Objects.csv to BASIC format
def process_objects_file(input_prefix, output_dir):
    input_csv = f"{input_prefix}_Objects.csv"
    output_bas = os.path.join(output_dir, f"{os.path.basename(input_prefix)}_Objects.bas")
    
    if not os.path.exists(input_csv):
        print(f"File {input_csv} not found.")
        return

    print(f"Processing file: {input_csv}")

    with open(input_csv, 'r') as csv_file:
        reader = csv.reader(csv_file)
        data = [[int(value) for value in row] for row in reader]
    
    teleport_positions = []
    ghouls = []
    skulls = []
    change_movements = []
    player = None
    level_gate = None
    level_exit = None
    
    for y, row in enumerate(data):
        for x, value in enumerate(row):
            if value == 5:
                teleport_positions.append((y, x))
            elif value == 0:
                ghouls.append((y, x))
            elif value == 1:
                skulls.append((y, x))
            elif value == 6:
                change_movements.append((y, x))
            elif value == 2:
                player = (y, x)
            elif value == 3:
                level_gate = (y, x)
            elif value == 4:
                level_exit = (y, x)
    
    with open(output_bas, 'w') as bas_file:
        bas_file.write(f"SUB {os.path.basename(input_prefix)}Init()\n")
        
        # Write teleport positions
        for i, (y, x) in enumerate(teleport_positions):
            bas_file.write(f"    teleportPosition({i}, 0) = {y}: teleportPosition({i}, 1) = {x}\n")
        
        # Write ghouls
        for i, (y, x) in enumerate(ghouls):
            bas_file.write(f"    ghouls({i}, 0) = {y}: ghouls({i}, 1) = {x}: ghouls({i}, 2) = 4: ghouls({i}, 3) = 0: ghouls({i}, 4) = {y}: ghouls({i}, 5) = {x}: ghouls({i}, 6) = 0: ghouls({i}, 7) = 0\n")

        # Write skulls
        for i, (y, x) in enumerate(skulls):
            bas_file.write(f"    skulls({i}, 0) = {y}: skulls({i}, 1) = {x}: skulls({i}, 2) = 4: skulls({i}, 3) = 0: skulls({i}, 4) = {y}: skulls({i}, 5) = {x}: skulls({i}, 6) = 0: skulls({i}, 7) = 0\n")
        
        # Write change movement positions
        for i, (y, x) in enumerate(change_movements):
            bas_file.write(f"    changeMovementPosition({i}, 0) = {y}: changeMovementPosition({i}, 1) = {x}\n")
        
        # Write player position
        if player:
            bas_file.write(f"    player(0) = {player[0]}: player(1) = {player[1]}: player(2) = 0\n")
        
        # Write level gate position
        if level_gate:
            bas_file.write(f"    levelGate(0) = {level_gate[0]}: levelGate(1) = {level_gate[1]}\n")
        
        # Write level exit position
        if level_exit:
            bas_file.write(f"    levelExit(0) = {level_exit[0]}: levelExit(1) = {level_exit[1]}\n")
        
        # Write the count of ghouls
        bas_file.write(f"    ghoulsCount = {len(ghouls)}\n")
        # Write the count of skulls
        bas_file.write(f"    skullsCount = {len(skulls)}\n")
        
        bas_file.write("END SUB\n")

    print(f"File {output_bas} created.")

# Main function to process both _Scene.csv and _Objects.csv
def csv_to_bas(input_prefix):
    output_dir = os.path.join(os.path.dirname(input_prefix), 'out')
    os.makedirs(output_dir, exist_ok=True)

    print(f"Creating output directory: {output_dir}")

    # Process _Scene.csv
    process_scene_file(input_prefix, output_dir)

    # Process _Objects.csv
    process_objects_file(input_prefix, output_dir)

# Command-line entry point
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script_name.py <input_prefix>")
        print("Where <input_prefix> is the path without extension, e.g., /path/to/level1")
        sys.exit(1)

    input_prefix = sys.argv[1]
    csv_to_bas(input_prefix)