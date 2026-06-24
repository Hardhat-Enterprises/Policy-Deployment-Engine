"""
Map each resource to its **verbatim** service/namespace (the docs folder name).

The provider schema has no notion of service grouping — that only lives in the
``subcategory`` field of each resource's markdown front matter. So we reuse docgen's
``RepositoryManager`` to sparse-clone the provider repo (markdown only), pinned to the
same version as the schema, and read the subcategory for every resource.

The subcategory is kept **verbatim** (spaces, parentheses preserved) per spec, e.g.
``Cloud Storage`` → folder ``docs/gcp/Cloud Storage/``.
"""

from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional

from scripts.docgen.lib.logging_config import get_logger
from scripts.docgen.lib.parser import extract_subcategory_from_frontmatter
from scripts.docgen.lib.repository_manager import RepositoryManager

logger = get_logger(__name__)

UNKNOWN_SERVICE = "Unknown"


def build_service_map(
    csp: str,
    version: Optional[str] = None,
    repo_manager: Optional[RepositoryManager] = None,
) -> Dict[str, str]:
    """Return ``{resource_name: subcategory}`` for every documented resource.

    Args:
        csp: 'gcp' / 'aws' / 'azure'.
        version: Provider version tag to pin the markdown clone to (e.g. '7.37.0').
        repo_manager: Optional injected RepositoryManager (for testing).
    """
    rm = repo_manager or RepositoryManager()
    repo_path = rm.clone_provider_repo(csp, version=version)
    resources = rm.list_all_resources(repo_path)

    service_map: Dict[str, str] = {}
    for resource_name in resources:
        try:
            md_path = rm.get_resource_markdown_path(repo_path, resource_name)
            content = md_path.read_text(encoding="utf-8")
            subcategory, _ = extract_subcategory_from_frontmatter(content)
            service_map[resource_name] = subcategory or UNKNOWN_SERVICE
        except Exception as e:  # noqa: BLE001 - missing/odd doc shouldn't abort the run
            logger.warning(f"No subcategory for {resource_name}: {e}")
            service_map[resource_name] = UNKNOWN_SERVICE

    logger.info(
        f"Built service map: {len(service_map)} resources across "
        f"{len(set(service_map.values()))} services"
    )
    return service_map


def group_by_service(service_map: Dict[str, str]) -> Dict[str, List[str]]:
    """Invert a service map into ``{subcategory: [resource_name, ...]}`` (sorted)."""
    grouped: Dict[str, List[str]] = defaultdict(list)
    for resource_name, subcategory in service_map.items():
        grouped[subcategory].append(resource_name)
    return {svc: sorted(names) for svc, names in sorted(grouped.items())}


def normalize_service(name: str) -> str:
    """Normalize a service name for tolerant matching (case/space/underscore-insensitive)."""
    return name.lower().replace("_", "").replace(" ", "")
