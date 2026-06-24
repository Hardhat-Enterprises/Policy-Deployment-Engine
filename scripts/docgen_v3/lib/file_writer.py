"""
Write docs_v2 resource JSON files and merge on refresh.

Output contract (exactly three top-level keys, in order):

    {
      "last_updated":     "<ISO-8601, set by the script>",
      "provider_version": "<CSP provider version, e.g. 7.37.0>",
      "arguments":        { ...flat dotted-key dict... }
    }

- Folder  = the service subcategory, **verbatim** (spaces kept).
- Filename = the resource type, **verbatim** with prefix, e.g. ``google_storage_bucket.json``.
"""

import json
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Optional

from scripts.docgen_v2.lib.logging_config import get_logger

logger = get_logger(__name__)

# Leaf fields that a contributor fills in by hand and we must never clobber on refresh.
PRESERVED_LEAF_FIELDS = ("security_impact", "rationale")
# Sentinel "unset" values for those fields (anything else is treated as human-authored).
_UNSET = {
    "security_impact": {None, "", "true/false"},
    "rationale": {None, ""},
}


def now_iso() -> str:
    """Current UTC time as ``YYYY-MM-DDTHH:MM:SSZ``."""
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def build_document(arguments: Dict[str, Any], provider_version: str, last_updated: Optional[str] = None) -> Dict[str, Any]:
    """Assemble the 3-key document in the required key order."""
    return {
        "last_updated": last_updated or now_iso(),
        "provider_version": provider_version,
        "arguments": arguments,
    }


# A subcategory may contain a forward slash (e.g. "Cloud Pub/Sub"), which would otherwise
# create a nested directory. We replace it with a double underscore so the service stays a
# single folder; everything else (spaces, parens) is kept verbatim.
SERVICE_SLASH_REPLACEMENT = "__"


def sanitize_service(subcategory: str) -> str:
    """Make a subcategory safe to use as a single folder name (only `/` is replaced)."""
    return subcategory.replace("/", SERVICE_SLASH_REPLACEMENT)


def target_path(output_root: Path, csp: str, subcategory: str, resource_name: str) -> Path:
    """Compute ``<output_root>/<csp>/<service>/<resource_name>.json`` (verbatim, `/`→`__`)."""
    return output_root / csp / sanitize_service(subcategory) / f"{resource_name}.json"


def write_document(path: Path, document: Dict[str, Any]) -> None:
    """Write a document as pretty JSON with a trailing newline (clean git diffs)."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(document, f, indent=2, ensure_ascii=False)
        f.write("\n")
    logger.info(f"Wrote {path}")


def load_document(path: Path) -> Optional[Dict[str, Any]]:
    """Load an existing document, or None if missing/unreadable."""
    if not path.exists():
        return None
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception as e:  # noqa: BLE001
        logger.warning(f"Could not read existing {path}: {e}")
        return None


def merge_preserving_human_fields(
    new_arguments: Dict[str, Any], existing_arguments: Dict[str, Any]
) -> Dict[str, Any]:
    """Carry contributor-authored security fields from the old args onto the new ones.

    Matching is by full dotted key. Arguments that no longer exist in ``new_arguments``
    are dropped (the schema no longer has them); brand-new arguments are kept as-is with
    their ``true/false``/``""`` placeholders. Only leaves (entries that have a
    ``security_impact`` field) can carry preserved values.
    """
    existing_arguments = existing_arguments or {}
    for key, entry in new_arguments.items():
        if "security_impact" not in entry:
            continue  # block entries have nothing to preserve
        old = existing_arguments.get(key)
        if not isinstance(old, dict):
            continue
        for field in PRESERVED_LEAF_FIELDS:
            old_value = old.get(field)
            if old_value not in _UNSET[field]:
                entry[field] = old_value
    return new_arguments
