"""
Markdown gating + description fallback.

The provider schema is authoritative for ``type``, ``required`` and nesting, but two
things require the markdown docs:

1. **Gating** — we only keep arguments that actually appear in the resource's markdown
   (the registry website). An argument the schema exposes but the markdown never
   documents (e.g. the ``condition`` block on many IAM resources) is omitted. Presence is
   matched by argument *name* (not reconstructed path), because the provider markdown is
   not reliable enough to rebuild deep dotted paths — name presence avoids wrongly
   dropping thousands of documented-but-deeply-nested args.

2. **Descriptions** — the schema leaves IAM resource descriptions blank, so a documented
   leaf with an empty schema description is filled from the markdown. If it is documented
   but has no description anywhere (only an ``(Optional)`` flag, e.g. ``pool``), the
   description is set to ``"N/A"``.

A block is kept if its own name is documented OR any of its kept descendant leaves are,
so the dotted children never become orphaned.

3. **Childless-block repair** — a block that is kept by name but whose schema children
   are *all* gated out would be emitted as a degenerate, childless block. This happens
   when the provider markdown documents a block's sub-fields *inline in the block's own
   bullet* (backticked, e.g. ``automated_backup_policy``'s ``retention_period`` /
   ``frequency``) or in a sub-section our name-matching doesn't harvest, rather than as
   their own ``* `name` -`` bullets. Since the schema is authoritative for what a block
   contains, when gating leaves a documented block with no children we restore its full
   schema subtree. Genuinely-empty provider blocks (oneof/presence markers with no
   attributes) have no schema children, so they correctly stay childless.
"""

import re
from pathlib import Path
from typing import Dict, Optional, Set, Tuple

from scripts.docgen.lib.logging_config import get_logger

logger = get_logger(__name__)

# A bullet like:  * `name` - (Required) Some description text   (also indented bullets)
_BULLET_RE = re.compile(r"^\s*\*\s+`([A-Za-z0-9_./]+)`\s*-\s*(.*)$", re.MULTILINE)
# A bullet that only names an argument, no description:  * `pool` - (Optional)
_BULLET_NAME_RE = re.compile(r"^\s*\*\s+`([A-Za-z0-9_./]+)`", re.MULTILINE)
# A block introduction:  The `condition` block supports:
_BLOCK_RE = re.compile(r"`([A-Za-z0-9_]+)`\s+block")
# A backticked resource reference, e.g. `google_compute_instance`.
_RESOURCE_REF_RE = re.compile(r"`(google_[a-z0-9_]+)`")
# A markdown-link resource reference, e.g. [google_container_cluster](container_cluster.html#nested_node_config).
_RESOURCE_LINK_RE = re.compile(r"\[(google_[a-z0-9_]+)\]\(")
# Words that signal whole-resource inheritance ("all arguments from `google_x` are supported").
_INHERIT_HINTS = ("supported", "inherited", "based on", "likewise")
# Words that signal a block points at another resource's page for its field schema
# ("See [google_container_cluster](...#nested_node_config) for schema").
_SCHEMA_HINTS = ("schema", "structure", "fields")
# A leading "(Required)" / "(Optional)" / "(Required only by `x`)" flag group to strip.
_LEADING_FLAG_RE = re.compile(r"^\([^)]*\)\s*")

_AMBIGUOUS = object()  # sentinel: name seen with conflicting descriptions

NA = "N/A"


def _names_from_token(token: str) -> Set[str]:
    """Split a bulleted token into the individual names it documents.

    Handles dotted bullets (``a.b``) and slash-combined names (``member/members``).
    """
    names: Set[str] = set()
    for segment in token.split("."):
        for piece in segment.split("/"):
            piece = piece.strip()
            if piece:
                names.add(piece)
    return names


def extract_documented_names(markdown_text: str) -> Set[str]:
    """Return the set of argument/block names documented anywhere in the markdown."""
    names: Set[str] = set()
    for token in _BULLET_NAME_RE.findall(markdown_text):
        names |= _names_from_token(token)
    for block_name in _BLOCK_RE.findall(markdown_text):
        names.add(block_name)
    return names


def extract_arg_descriptions(markdown_text: str) -> Dict[str, str]:
    """Parse a provider markdown doc into ``{arg_name: description}``.

    Captures the first paragraph of each ``* `name` - ...`` bullet, strips a leading
    flag group, splits combined names, and drops names with conflicting descriptions.
    """
    raw: Dict[str, object] = {}
    lines = markdown_text.splitlines()
    i, n = 0, len(lines)

    while i < n:
        match = _BULLET_RE.match(lines[i])
        if not match:
            i += 1
            continue

        names, first = match.group(1), match.group(2).strip()
        parts = [first] if first else []

        j = i + 1
        while j < n:
            line = lines[j]
            if not line.strip():
                break
            if not line[0].isspace():  # next top-level bullet / heading
                break
            if line.lstrip().startswith("*"):  # sub-bullet enumeration
                break
            parts.append(line.strip())
            j += 1

        description = _LEADING_FLAG_RE.sub("", " ".join(parts)).strip()
        if description:
            for name in _names_from_token(names):
                if name in raw and raw[name] != description:
                    raw[name] = _AMBIGUOUS
                elif name not in raw:
                    raw[name] = description
        i = j if j > i else i + 1

    return {k: v for k, v in raw.items() if v is not _AMBIGUOUS and isinstance(v, str)}


def extract_inherited_resources(markdown_text: str) -> Set[str]:
    """Return resources whose arguments this doc inherits by reference.

    Two reference styles are detected:

    1. Whole-resource: "all arguments from `google_compute_instance` are supported" — a
       backticked ``google_*`` on a line mentioning arguments/attributes + an inheritance
       hint (e.g. ``google_compute_instance_from_template``).
    2. Block-level: a markdown link to another resource for a block's field schema,
       "See [google_container_cluster](...#nested_node_config) for schema" — a
       ``[google_*](...)`` link on a line mentioning schema/structure/fields (e.g.
       ``google_container_node_pool``'s ``node_config`` block).

    Such resources don't re-list the referenced args, so we gate/fill them against the
    base doc too.
    """
    out: Set[str] = set()
    for line in markdown_text.splitlines():
        low = line.lower()
        refs = _RESOURCE_REF_RE.findall(line)
        if refs and ("argument" in low or "attribute" in low) and any(h in low for h in _INHERIT_HINTS):
            out.update(refs)
        links = _RESOURCE_LINK_RE.findall(line)
        if links and any(h in low for h in _SCHEMA_HINTS):
            out.update(links)
    return out


def _leaf(path: str) -> str:
    return path.rsplit(".", 1)[-1]


class MarkdownProcessor:
    """Gates schema arguments to those documented in markdown and fills descriptions."""

    def __init__(self, repo_manager, repo_path: Path):
        self.repo_manager = repo_manager
        self.repo_path = repo_path
        # md path -> (own_names, own_descs, text)  — this resource only, no inheritance
        self._own_cache: Dict[str, Tuple[Set[str], Dict[str, str], str]] = {}
        # md path -> (names, descs)  — resolved with one level of inheritance merged in
        self._cache: Dict[str, Tuple[Set[str], Dict[str, str]]] = {}

    def _md_path(self, resource_name: str):
        try:
            return self.repo_manager.get_resource_markdown_path(self.repo_path, resource_name)
        except Exception:
            return None

    def _own(self, resource_name: str) -> Optional[Tuple[Set[str], Dict[str, str], str]]:
        """Documented names + descriptions for this resource's own page only (cached)."""
        md_path = self._md_path(resource_name)
        if md_path is None:
            return None
        key = str(md_path)
        if key not in self._own_cache:
            try:
                text = md_path.read_text(encoding="utf-8")
            except Exception as e:  # noqa: BLE001
                logger.warning(f"Could not read markdown for {resource_name}: {e}")
                return None
            self._own_cache[key] = (extract_documented_names(text), extract_arg_descriptions(text), text)
        return self._own_cache[key]

    def _load(self, resource_name: str) -> Optional[Tuple[Set[str], Dict[str, str]]]:
        """Resolved documented names/descriptions, merging one level of inheritance.

        Inheritance is intentionally one level deep (we merge each referenced base's *own*
        names, not its transitively-inherited ones). This is enough for the real cases and
        avoids infinite recursion when two resources reference each other (e.g.
        container_cluster <-> container_node_pool).
        """
        own = self._own(resource_name)
        if own is None:
            return None
        own_names, own_descs, text = own
        key = str(self._md_path(resource_name))
        if key in self._cache:
            return self._cache[key]

        names = set(own_names)
        descriptions = dict(own_descs)
        for base in extract_inherited_resources(text):
            if base == resource_name:
                continue
            base_own = self._own(base)
            if base_own:
                base_names, base_descs, _ = base_own
                names |= base_names
                descriptions = {**base_descs, **descriptions}  # own page wins on conflicts
                logger.info(f"{resource_name}: inheriting documented args from {base}")

        self._cache[key] = (names, descriptions)
        return self._cache[key]

    def process(self, resource_name: str, arguments: Dict[str, dict]) -> Tuple[Dict[str, dict], dict]:
        """Filter ``arguments`` to documented ones and fill descriptions.

        Returns ``(filtered_arguments, stats)`` where stats has ``omitted`` and ``na``.
        If the markdown can't be read, arguments are returned unchanged (fail open).
        """
        loaded = self._load(resource_name)
        if loaded is None:
            logger.warning(f"{resource_name}: no markdown; keeping all schema args unfiltered")
            return arguments, {"omitted": 0, "na": 0}
        names, name_desc = loaded

        kept_leaves = {
            k for k, v in arguments.items()
            if v.get("type") != "block" and _leaf(k) in names
        }

        # Childless-block repair: a block kept by its own documented name but with no kept
        # descendant leaf would be emitted childless. Restore its whole schema subtree so
        # the documented block carries the contents the provider defines for it. Blocks
        # with no schema children (presence markers) gain nothing and stay childless.
        forced = set()
        for key, entry in arguments.items():
            if entry.get("type") != "block" or _leaf(key) not in names:
                continue
            descendants = [k for k in arguments if k.startswith(key + ".")]
            if descendants and not any(kl.startswith(key + ".") for kl in kept_leaves):
                forced.update(descendants)
        kept_leaves |= {
            k for k in forced if arguments[k].get("type") != "block"
        }

        result: Dict[str, dict] = {}
        na = 0
        for key, entry in arguments.items():
            if entry.get("type") == "block":
                if _leaf(key) in names or key in forced or any(
                    p.startswith(key + ".") for p in kept_leaves
                ):
                    result[key] = entry
                continue
            if key not in kept_leaves:
                continue
            if not entry.get("description"):
                desc = name_desc.get(_leaf(key))
                entry["description"] = desc if desc else NA
                if not desc:
                    na += 1
            result[key] = entry

        return result, {"omitted": len(arguments) - len(result), "na": na}
