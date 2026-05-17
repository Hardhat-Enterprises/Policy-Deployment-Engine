#!/usr/bin/env python3
"""
Build the Automated Policy Tracker outputs (CSV + HTML dashboard).

Usage:
    python build_tracker.py
    python build_tracker.py --docs docs --output-dir docs/service-status
"""

import argparse
import shutil
import sys
from datetime import datetime, timezone
from pathlib import Path

from completion_checker import ResourceInventoryGenerator
from generate_dashboard import generate_dashboard_html


def default_repo_root():
    return Path(__file__).resolve().parents[2]


def main():
    repo_root = default_repo_root()
    default_output_dir = repo_root / 'docs' / 'service-status'

    parser = argparse.ArgumentParser(
        description='Build APT CSV inventory and HTML dashboard for GitHub Pages',
    )
    parser.add_argument(
        '--docs',
        default=str(repo_root / 'docs'),
        help='Path to docs directory (default: <repo>/docs)',
    )
    parser.add_argument(
        '--output-dir',
        default=str(default_output_dir),
        help='Directory for generated dashboard files (default: docs/service-status)',
    )
    args = parser.parse_args()

    docs_path = Path(args.docs)
    output_dir = Path(args.output_dir)
    csv_path = output_dir / 'resource_inventory.csv'
    html_path = output_dir / 'index.html'

    if not docs_path.is_dir():
        print(f"[ERROR] Docs directory not found: {docs_path}")
        sys.exit(1)

    print('Building Automated Policy Tracker...')
    print(f"  Docs:   {docs_path.resolve()}")
    print(f"  Output: {output_dir.resolve()}")
    print()

    generator = ResourceInventoryGenerator(docs_path)
    inventory = generator.build_inventory_data()
    if not inventory:
        print('[ERROR] No resource JSON files found under docs/gcp')
        sys.exit(1)

    output_dir.mkdir(parents=True, exist_ok=True)

    if not generator.generate_csv(inventory, csv_path):
        sys.exit(1)

    generated_at = datetime.now(timezone.utc)
    generate_dashboard_html(inventory, html_path, generated_at=generated_at)

    # Keep a copy in scripts for local reference / PR diffs
    scripts_copy = Path(__file__).parent / 'resource_inventory.csv'
    shutil.copy2(csv_path, scripts_copy)

    print(f"[OK] Dashboard saved to: {html_path}")
    print()
    print('GitHub Pages URL (after merge + Pages enabled):')
    print('  https://hardhat-enterprises.github.io/Policy-Deployment-Engine/docs/service-status/')


if __name__ == '__main__':
    main()
