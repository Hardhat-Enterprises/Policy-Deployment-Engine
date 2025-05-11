#!/usr/bin/env python3
import os
import re
import argparse

def strip_version_lines_from_file(file_path):
    """
    Open the given file, remove any line that sets `version = ...`,
    and overwrite the file if any such lines were found.

    Returns:
        bool: True if we removed at least one version line (and rewrote the file),
              False otherwise.
    """
    # A regex that matches lines like:    version = "1.2.3"
    version_line_regex = re.compile(r'^\s*version\s*=.*$')

    # Read in the entire file
    with open(file_path, 'r', encoding='utf-8') as f:
        original_lines = f.readlines()

    # Keep only lines that do NOT match our "version =" pattern
    filtered_lines = [
        line for line in original_lines
        if not version_line_regex.match(line)
    ]

    # If anything changed, write the cleaned content back out
    if len(filtered_lines) != len(original_lines):
        with open(file_path, 'w', encoding='utf-8') as f:
            f.writelines(filtered_lines)
        print(f"Removed version lines in: {file_path}")
        return True

    # No changes needed
    return False

def remove_versions_in_configs(root_folder):
    """
    Walk through every subdirectory starting at `root_folder`,
    find files named exactly 'config.tf', and strip out any
    version lines from them.
    """
    files_touched = 0

    print(f"Scanning for config.tf files under: {root_folder}")
    for current_dir, _, filenames in os.walk(root_folder):
        for filename in filenames:
            if filename.lower() == 'config.tf':
                full_path = os.path.join(current_dir, filename)
                if strip_version_lines_from_file(full_path):
                    files_touched += 1

    print(f"\nDone! Updated {files_touched} config.tf file(s).")

def main():
    parser = argparse.ArgumentParser(
        description="Scan for all config.tf files and remove any 'version = …' lines."
    )
    parser.add_argument(
        '--root',
        default='.',
        help="Directory to start scanning from (default: current folder)."
    )
    args = parser.parse_args()

    remove_versions_in_configs(args.root)

if __name__ == "__main__":
    main()
