#!/usr/bin/env python3
"""
docgen_v3 — spec-conformant GCP documentation generator (writes to docs_v2/).

Pipeline:
    1. Fetch the authoritative provider schema via terraform/tofu (types, required,
       nesting)                                          -> lib/schema_source.py
    2. Map each resource to its verbatim service folder from markdown front matter
                                                          -> lib/service_map.py
    3. Flatten each resource's schema into a flat dotted-key arguments dict
                                                          -> lib/arg_flatten.py
    4. Write the 3-key JSON (last_updated, provider_version, arguments) per resource
                                                          -> lib/file_writer.py

Re-run modes:
    --mode identify-new       Create files that don't exist yet; never touch existing
                              files (so per-resource pinned versions are preserved).
    --mode refresh-existing   Only update files that already exist: prune arguments the
                              provider dropped, add new ones, and preserve contributor
                              security_impact / rationale. Does not create new files.

Usage:
    uv run python scripts/docgen_v3/generator.py --csp gcp --mode identify-new --test
    uv run python scripts/docgen_v3/generator.py --csp gcp --mode identify-new
    uv run python scripts/docgen_v3/generator.py --csp gcp --mode refresh-existing \
        --service "Cloud Storage"

Exit codes follow scripts/docgen_v2/lib/errors.py.
"""

import argparse
import sys
from pathlib import Path

# Make `scripts.*` importable when run as a script (mirrors docgen_v2/generator.py).
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from scripts.docgen_v2.lib.errors import GeneratorError, EXIT_SUCCESS, EXIT_CONFIG_ERROR  # noqa: E402
from scripts.docgen_v2.lib.logging_config import get_logger, setup_logging  # noqa: E402
from scripts.docgen_v2.lib.repository_manager import RepositoryManager  # noqa: E402
from scripts.docgen_v3.lib.arg_flatten import flatten_arguments  # noqa: E402
from scripts.docgen_v3.lib.canonical import apply_canonical  # noqa: E402
from scripts.docgen_v3.lib import file_writer  # noqa: E402
from scripts.docgen_v3.lib.descriptions import MarkdownProcessor  # noqa: E402
from scripts.docgen_v3.lib.schema_source import SchemaSource  # noqa: E402
from scripts.docgen_v3.lib.service_map import (  # noqa: E402
    build_service_map,
    group_by_service,
    normalize_service,
)

logger = get_logger(__name__)

MODE_IDENTIFY_NEW = "identify-new"
MODE_REFRESH_EXISTING = "refresh-existing"

# Services used by --test when the user doesn't specify --service. Picked because they
# exercise simple leaves, deep block nesting, and IAM variants.
PREFERRED_TEST_SERVICES = ["Cloud Storage", "BigQuery"]
TEST_SERVICE_COUNT = 2

# Resources whose documented args cover less than this fraction of their schema args are
# flagged for human review (possible inheritance reference or a provider doc gap).
COVERAGE_WARN_THRESHOLD = 0.5
COVERAGE_MIN_LEAVES = 8  # don't flag tiny resources


def parse_args(argv=None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate spec-conformant resource docs into docs_v2/.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--csp", choices=["gcp"], default="gcp",
                        help="Cloud provider (only gcp supported for now).")
    parser.add_argument("--mode", required=True,
                        choices=[MODE_IDENTIFY_NEW, MODE_REFRESH_EXISTING],
                        help="Re-run behaviour.")
    parser.add_argument("--service", nargs="*", default=None,
                        help="Limit to these services (verbatim or fuzzy match).")
    parser.add_argument("--test", action="store_true",
                        help=f"Temporary test mode: only {TEST_SERVICE_COUNT} services "
                             "(default: Cloud Storage + BigQuery, or --service override).")
    parser.add_argument("--provider-version", default=None,
                        help="Pin a provider version (e.g. 7.37.0); default latest.")
    parser.add_argument("--output-dir", default="docs_v2",
                        help="Output root directory (default: docs_v2).")
    parser.add_argument("--silent", action="store_true",
                        help="Suppress console output except errors.")
    return parser.parse_args(argv)


def select_services(all_services, requested, test_mode):
    """Resolve the set of service names to process."""
    available = set(all_services)
    if requested:
        chosen = []
        for r in requested:
            norm = normalize_service(r)
            matches = [s for s in all_services if normalize_service(s) == norm]
            if not matches:
                matches = [s for s in all_services if norm in normalize_service(s)]
            if matches:
                chosen.extend(matches)
            else:
                logger.warning(f"No service matched '{r}'")
        chosen = sorted(set(chosen))
    elif test_mode:
        chosen = [s for s in PREFERRED_TEST_SERVICES if s in available]
        if len(chosen) < TEST_SERVICE_COUNT:
            for s in sorted(all_services):
                if s not in chosen:
                    chosen.append(s)
                if len(chosen) >= TEST_SERVICE_COUNT:
                    break
    else:
        chosen = sorted(all_services)

    if test_mode:
        chosen = chosen[:TEST_SERVICE_COUNT]
    return chosen


def run(args: argparse.Namespace) -> int:
    output_root = Path(args.output_dir)

    # 1. Authoritative schema (types/required/nesting) + resolved provider version.
    schema_source = SchemaSource()
    resource_schemas, version = schema_source.get_resource_schemas(
        args.csp, version=args.provider_version
    )

    # 2. Verbatim service grouping from markdown, pinned to the same version.
    repo_manager = RepositoryManager()
    repo_path = repo_manager.clone_provider_repo(args.csp, version=version)
    service_map = build_service_map(args.csp, version=version, repo_manager=repo_manager)
    grouped = group_by_service(service_map)

    # Gates args to those documented in markdown and fills empty descriptions (IAM / N/A).
    processor = MarkdownProcessor(repo_manager, repo_path)

    selected = select_services(list(grouped.keys()), args.service, args.test)
    if not selected:
        logger.error("No services selected; nothing to do.")
        return EXIT_CONFIG_ERROR
    logger.info(f"Mode={args.mode} | provider v{version} | services: {selected}")

    created = updated = skipped = missing_schema = 0
    total_omitted = total_na = 0
    low_coverage = []  # (kept_leaves, total_leaves, resource_name)

    for service in selected:
        for resource_name in grouped.get(service, []):
            schema = resource_schemas.get(resource_name)
            if schema is None:
                missing_schema += 1
                logger.warning(f"{resource_name}: not in provider schema; skipping")
                continue

            flat = flatten_arguments(schema.get("block", {}))
            total_leaves = sum(1 for v in flat.values() if v.get("type") != "block")
            arguments, stats = processor.process(resource_name, flat)
            apply_canonical(resource_name, arguments)  # prepopulate locked cross-cutting keys
            kept_leaves = sum(1 for v in arguments.values() if v.get("type") != "block")
            total_omitted += stats["omitted"]
            total_na += stats["na"]
            if total_leaves >= COVERAGE_MIN_LEAVES and kept_leaves / total_leaves < COVERAGE_WARN_THRESHOLD:
                low_coverage.append((kept_leaves, total_leaves, resource_name))
            path = file_writer.target_path(output_root, args.csp, service, resource_name)
            exists = path.exists()

            if args.mode == MODE_IDENTIFY_NEW:
                if exists:
                    skipped += 1
                    logger.debug(f"exists, skip: {path}")
                    continue
                file_writer.write_document(path, file_writer.build_document(arguments, version))
                created += 1
            else:  # refresh-existing
                if not exists:
                    skipped += 1
                    logger.debug(f"not existing, skip: {resource_name}")
                    continue
                existing = file_writer.load_document(path) or {}
                merged = file_writer.merge_preserving_human_fields(
                    arguments, existing.get("arguments", {})
                )
                file_writer.write_document(path, file_writer.build_document(merged, version))
                updated += 1

    if low_coverage:
        logger.warning(
            f"{len(low_coverage)} resource(s) with <{int(COVERAGE_WARN_THRESHOLD * 100)}% "
            f"of schema args documented (review for inheritance refs or doc gaps):"
        )
        for kept, total, rn in sorted(low_coverage):
            logger.warning(f"  {rn}: {kept}/{total} leaf args documented")

    logger.info(
        f"Done. created={created} updated={updated} skipped={skipped} "
        f"missing_schema={missing_schema} | args_omitted_undocumented={total_omitted} "
        f"descriptions_set_NA={total_na}"
    )
    return EXIT_SUCCESS


def main(argv=None) -> int:
    args = parse_args(argv)
    setup_logging(silent=args.silent)
    try:
        return run(args)
    except GeneratorError as e:
        e.write_to_stderr()
        return e.exit_code


if __name__ == "__main__":
    sys.exit(main())
