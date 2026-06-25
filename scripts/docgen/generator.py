#!/usr/bin/env python3
"""
docgen — spec-conformant GCP documentation generator (writes to docs/).

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
    uv run python scripts/docgen/generator.py --csp gcp --mode identify-new --test
    uv run python scripts/docgen/generator.py --csp gcp --mode identify-new
    uv run python scripts/docgen/generator.py --csp gcp --mode refresh-existing \
        --service "Cloud Storage"

Exit codes follow scripts/docgen/lib/errors.py.
"""

import argparse
import sys
from pathlib import Path

# Make `scripts.*` importable when run as a script (mirrors docgen/generator.py).
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from scripts.docgen.lib.errors import GeneratorError, EXIT_SUCCESS, EXIT_CONFIG_ERROR  # noqa: E402
from scripts.docgen.lib.logging_config import get_logger, setup_logging  # noqa: E402
from scripts.docgen.lib.repository_manager import RepositoryManager  # noqa: E402
from scripts.docgen.lib.arg_flatten import flatten_arguments  # noqa: E402
from scripts.docgen.lib.canonical import apply_canonical  # noqa: E402
from scripts.docgen.lib import file_writer  # noqa: E402
from scripts.docgen.lib.descriptions import MarkdownProcessor  # noqa: E402
from scripts.docgen.lib.schema_source import SchemaSource  # noqa: E402
from scripts.docgen.lib.service_map import (  # noqa: E402
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
        description="Generate spec-conformant resource docs into docs/.",
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
    parser.add_argument("--output-dir", default="docs",
                        help="Output root directory (default: docs).")
    parser.add_argument("--silent", action="store_true",
                        help="Suppress console output except errors.")
    return parser.parse_args(argv)


def select_services(all_services, requested, test_mode):
    """Resolve the set of service names to process.

    An explicit ``--service`` request is honoured in full, even alongside
    ``--test`` (``--test`` only caps the *default* selection — its help calls
    ``--service`` an override). Only when no services are requested does
    ``--test`` limit the run to ``TEST_SERVICE_COUNT`` services.
    """
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
        return sorted(set(chosen))

    if test_mode:
        available = set(all_services)
        chosen = [s for s in PREFERRED_TEST_SERVICES if s in available]
        if len(chosen) < TEST_SERVICE_COUNT:
            for s in sorted(all_services):
                if s not in chosen:
                    chosen.append(s)
                if len(chosen) >= TEST_SERVICE_COUNT:
                    break
        return chosen[:TEST_SERVICE_COUNT]

    return sorted(all_services)


def _doc_unchanged(existing: dict, new_doc: dict) -> bool:
    """True if the docs differ only by their ``last_updated`` timestamp."""
    a = {k: v for k, v in existing.items() if k != "last_updated"}
    b = {k: v for k, v in new_doc.items() if k != "last_updated"}
    return a == b


def run(args: argparse.Namespace) -> int:
    output_root = Path(args.output_dir)

    # 1. Authoritative schema (types/required/nesting) + resolved provider version.
    schema_source = SchemaSource()
    resource_schemas, version = schema_source.get_resource_schemas(
        args.csp, version=args.provider_version
    )

    # 2. Verbatim service grouping from markdown, pinned to the same version.
    #    Clone once and reuse the path so build_service_map doesn't re-clone/checkout.
    repo_manager = RepositoryManager()
    repo_path = repo_manager.clone_provider_repo(args.csp, version=version)
    service_map = build_service_map(
        args.csp, version=version, repo_manager=repo_manager, repo_path=repo_path)
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
    run_timestamp = file_writer.now_iso()  # one timestamp for every file in this run

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
                # Prepopulate locked cross-cutting keys (canonical always wins).
                apply_canonical(resource_name, arguments)
                file_writer.write_document(
                    path, file_writer.build_document(arguments, version, run_timestamp))
                created += 1
            else:  # refresh-existing
                if not exists:
                    skipped += 1
                    logger.debug(f"not existing, skip: {resource_name}")
                    continue
                existing = file_writer.load_document(path)
                if existing is None:
                    # File exists but is unreadable/corrupt — skip rather than
                    # overwrite, which would discard any human-authored fields.
                    skipped += 1
                    logger.warning(f"unreadable existing doc, skipping: {path}")
                    continue
                merged = file_writer.merge_preserving_human_fields(
                    arguments, existing.get("arguments", {})
                )
                # Apply canonical AFTER the human-field merge so locked cross-cutting
                # keys can't be overwritten by a stale per-resource value (canonical
                # always wins, per canonical.py's contract).
                apply_canonical(resource_name, merged)
                new_doc = file_writer.build_document(merged, version, run_timestamp)
                # Skip the write (and the churned last_updated) when nothing else changed.
                if _doc_unchanged(existing, new_doc):
                    skipped += 1
                    logger.debug(f"unchanged, skip: {path}")
                    continue
                file_writer.write_document(path, new_doc)
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
