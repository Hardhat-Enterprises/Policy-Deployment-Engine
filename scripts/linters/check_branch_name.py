#!/usr/bin/env python3
"""
Validate branch naming convention. Allowed branches:

- feature/<name>
- chore/<name>
- Service/<platform>/<service_slug>/<resource_type>
    * <platform>: gcp | aws | azure (only gcp is populated today)
    * <service_slug>: the underscore slug of a docs/<platform> service folder
      (e.g. "Cloud Run (v2 API)" -> "cloud_run_v2_api"). Docs folder names contain
      spaces/parens that are illegal in git branch names, so the slug is used; it
      maps back to exactly one folder.
    * <resource_type>: a documented resource — docs/<platform>/<folder>/<rt>.json
      must exist. Resource names are [a-z0-9_] and used verbatim.
- Protected: dev

Examples:
- feature/add-validator
- chore/docgen-consolidation
- Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service
- dev (protected)

Invalid: gcp/service/x, fix/x, docs/x, my-branch, main
"""
import argparse
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _service_slug import slug_to_folder, resource_doc_path  # noqa: E402

ALLOWED_PLATFORMS = {"gcp", "aws", "azure"}
PROTECTED_BRANCHES = {"dev"}
# feature/<name> | chore/<name>: <name> is free-form (letters incl. uppercase,
# digits, '.', '_', '-', and '/' for sub-scopes), min 2 chars.
SIMPLE_BRANCH = re.compile(r"^(feature|chore)/[A-Za-z0-9._/-]{2,}$")
RESOURCE_TYPE = re.compile(r"^[a-z0-9_]+$")


def get_current_branch():
    """Return the current branch name, or None if it can't be determined
    (git failure / not a repo / detached HEAD — common in CI, where --branch
    should be passed explicitly)."""
    result = subprocess.run(
        ["git", "rev-parse", "--abbrev-ref", "HEAD"], capture_output=True, text=True)
    if result.returncode != 0:
        return None
    branch = result.stdout.strip()
    if not branch or branch == "HEAD":  # empty or detached HEAD
        return None
    return branch


def _allowed_formats():
    return (
        "Allowed branch names:\n"
        "  - feature/<name>\n"
        "  - chore/<name>\n"
        "  - Service/<platform>/<service_slug>/<resource_type>\n"
        "      platform in gcp|aws|azure; service_slug is the underscore slug of a\n"
        "      docs/<platform> service folder; resource_type is a documented resource.\n"
        "      e.g. Service/gcp/cloud_run_v2_api/google_cloud_run_v2_service\n"
        "  - (protected: dev)"
    )


def validate_branch_name(branch, docs_root="docs"):
    """Return (is_valid, error_message_or_None)."""
    if SIMPLE_BRANCH.match(branch):
        return True, None

    parts = branch.split("/")
    if parts and parts[0] == "Service":
        if len(parts) != 4:
            return False, (f"Branch '{branch}': Service branches must be exactly "
                           f"Service/<platform>/<service_slug>/<resource_type>.\n\n" + _allowed_formats())
        _, platform, slug, resource = parts
        if platform not in ALLOWED_PLATFORMS:
            return False, (f"Branch '{branch}': platform '{platform}' must be one of "
                           f"{sorted(ALLOWED_PLATFORMS)}.")
        if not RESOURCE_TYPE.match(resource):
            return False, (f"Branch '{branch}': resource type '{resource}' must match "
                           f"[a-z0-9_]+.")
        folder = slug_to_folder(docs_root, platform).get(slug)
        if folder is None:
            return False, (f"Branch '{branch}': service slug '{slug}' does not match any "
                           f"docs/{platform} service. The slug is the lowercased, "
                           f"underscore-separated form of the docs folder name "
                           f"(e.g. 'Cloud Run (v2 API)' -> 'cloud_run_v2_api').")
        if not os.path.isfile(resource_doc_path(docs_root, platform, folder, resource)):
            return False, (f"Branch '{branch}': resource '{resource}' is not documented under "
                           f"docs/{platform}/{folder}/ (expected {resource}.json).")
        return True, None

    return False, (f"Branch '{branch}' does not match the naming convention.\n\n" + _allowed_formats())


def main(argv=None):
    parser = argparse.ArgumentParser(description="Validate the git branch name.")
    parser.add_argument("--branch", default=None,
                        help="Branch to validate (default: current git branch).")
    parser.add_argument("--docs", default="docs", help="Docs root (default: docs).")
    args = parser.parse_args(argv)

    branch = args.branch if args.branch is not None else get_current_branch()
    if not branch:
        print("[ERROR] could not determine the current git branch "
              "(not a repo, or detached HEAD). Pass --branch <name> explicitly.")
        return 2

    if branch in PROTECTED_BRANCHES:
        print(f"[*] Branch '{branch}' is allowed (protected branch)")
        return 0

    is_valid, error = validate_branch_name(branch, args.docs)
    if is_valid:
        print(f"[OK] Branch '{branch}' follows naming convention")
        return 0
    print("[FAIL] Invalid branch name\n")
    print(f"{error}\n")
    return 1


if __name__ == "__main__":
    sys.exit(main())
