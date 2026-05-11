#!/usr/bin/env python3
"""
PDE Service Resource Inventory Generator

Generates CSV inventory of all GCP services with resource and attribute counts.
Reads from docs/gcp resource JSON files and outputs a formatted CSV.

Usage:
    python completion_checker.py                               # CSV inventory
    python completion_checker.py --output my_inventory.csv     # Custom output filename
    python completion_checker.py --docs path/to/docs           # Custom docs path
"""

import os
import csv
import sys
import json
import argparse
from pathlib import Path


class ResourceInventoryGenerator:
    def __init__(self, docs_root):
        self.docs_root = Path(docs_root).resolve()
    
    def count_attributes_in_json(self, json_data):
        """
        Count attributes in a resource JSON file.
        If an argument has nested 'arguments', count only the children, not the parent.
        Otherwise, count the argument itself.
        """
        count = 0
        arguments = json_data.get('arguments', {})
        
        for arg_name, arg_data in arguments.items():
            if isinstance(arg_data, dict):
                # If this argument has nested arguments, count only the nested ones
                if 'arguments' in arg_data:
                    nested_args = arg_data.get('arguments', {})
                    count += len(nested_args)
                else:
                    # No nested arguments, count this argument
                    count += 1
        
        return count
    
    def get_resource_json_files(self, resource_json_path):
        """Get list of JSON files in a resource_json directory."""
        json_files = []
        if not resource_json_path.exists():
            return json_files
        
        try:
            for item in os.listdir(resource_json_path):
                if item.endswith('.json'):
                    json_files.append(item)
        except (OSError, PermissionError) as e:
            print(f"[WARNING] Could not read {resource_json_path}: {e}")
        
        return sorted(json_files)
    
    def build_inventory_data(self):
        """Build inventory data from resource JSON files in docs/gcp."""
        inventory_data = {}
        
        # Find all service folders in docs/gcp
        gcp_docs_path = self.docs_root / 'gcp'
        if not gcp_docs_path.exists():
            print(f"[ERROR] docs/gcp directory not found: {gcp_docs_path}")
            return inventory_data
        
        services = []
        try:
            services = sorted([
                item for item in os.listdir(gcp_docs_path)
                if os.path.isdir(gcp_docs_path / item) 
                and not item.startswith(('_', '.'))
            ])
        except (OSError, PermissionError) as e:
            print(f"[ERROR] Could not read docs/gcp: {e}")
            return inventory_data
        
        # For each service, read its resource JSON files
        for service_name in services:
            resource_json_path = gcp_docs_path / service_name / 'resource_json'
            
            if not resource_json_path.exists():
                continue
            
            json_files = self.get_resource_json_files(resource_json_path)
            
            if not json_files:
                continue
            
            service_data = {
                'resources': [],
                'total_attributes': 0
            }
            
            for json_file in json_files:
                try:
                    json_path = resource_json_path / json_file
                    # Try utf-8-sig first to handle BOM, then fall back to utf-8
                    try:
                        with open(json_path, 'r', encoding='utf-8-sig') as f:
                            json_content = json.load(f)
                    except UnicodeDecodeError:
                        with open(json_path, 'r', encoding='utf-8', errors='ignore') as f:
                            json_content = json.load(f)
                    
                    attr_count = self.count_attributes_in_json(json_content)
                    resource_name = json_file.replace('.json', '')
                    
                    service_data['resources'].append({
                        'name': resource_name,
                        'attributes': attr_count
                    })
                    service_data['total_attributes'] += attr_count
                    
                except (json.JSONDecodeError, IOError) as e:
                    print(f"[WARNING] Could not read {json_file}: {e}")
            
            if service_data['resources']:
                inventory_data[service_name] = service_data
        
        return inventory_data
    
    def generate_csv(self, inventory_data, output_file):
        """Generate CSV with service info and resources in separate columns."""
        try:
            with open(output_file, 'w', newline='', encoding='utf-8') as f:
                writer = csv.writer(f)
                
                # Write header
                writer.writerow(['Service', 'Resource Count', 'Total Attributes', 'Resource Name', 'Attribute Count'])
                
                # Write data for each service
                for service_name in sorted(inventory_data.keys()):
                    service_data = inventory_data[service_name]
                    resources = service_data['resources']
                    total_attrs = service_data['total_attributes']
                    
                    # First resource row includes service info
                    if resources:
                        writer.writerow([
                            service_name,
                            len(resources),
                            total_attrs,
                            resources[0]['name'],
                            resources[0]['attributes']
                        ])
                        
                        # Additional resource rows
                        for resource in resources[1:]:
                            writer.writerow([
                                '',
                                '',
                                '',
                                resource['name'],
                                resource['attributes']
                            ])
                    
                    # Empty row for spacing
                    writer.writerow([])
            
            print(f"✓ CSV inventory saved to: {output_file}")
            return True
            
        except IOError as e:
            print(f"[ERROR] Could not write CSV inventory: {e}")
            return False


def main():
    parser = argparse.ArgumentParser(
        description='Generate CSV inventory of PDE services with resource and attribute counts from JSON files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python completion_checker.py
  python completion_checker.py --output my_inventory.csv
  python completion_checker.py --docs path/to/docs
        """
    )
    
    parser.add_argument(
        '--docs',
        default='docs',
        help='Path to docs directory (default: docs)'
    )
    parser.add_argument(
        '--output',
        default='service_inventory.csv',
        help='Output CSV filename (default: service_inventory.csv)'
    )
    
    args = parser.parse_args()
    
    # Validate path exists
    if not os.path.isdir(args.docs):
        print(f"[ERROR] Docs directory not found: {args.docs}")
        sys.exit(1)
    
    print(f"Generating resource inventory from JSON files...")
    print(f"  Docs: {os.path.abspath(args.docs)}")
    print()
    
    generator = ResourceInventoryGenerator(args.docs)
    inventory_data = generator.build_inventory_data()
    
    if not inventory_data:
        print("[ERROR] Failed to build inventory - no resource JSON files found")
        sys.exit(1)
    
    if generator.generate_csv(inventory_data, args.output):
        print(f"✓ Generation complete!")
    else:
        print("[ERROR] Failed to generate CSV")
        sys.exit(1)


if __name__ == '__main__':
    main()