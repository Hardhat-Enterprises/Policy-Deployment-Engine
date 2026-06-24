"""
Flatten a Terraform provider resource schema into the docs_v2 ``arguments`` dict.

The provider schema (from ``terraform/tofu providers schema -json``) represents a
resource as a *block* containing:

- ``attributes``  — leaf arguments that receive a direct value (string/bool/number/
  collection). Some attributes carry an *object* type, which is itself a set of
  sub-fields and is therefore treated as a block.
- ``block_types`` — nested blocks that contain their own attributes / block_types.

This module walks that tree and produces a single **flat** dictionary whose keys are
**dotted paths** (``block.sub_block.leaf``), so leaf names that repeat under different
blocks never collide. Each entry is one of:

- leaf  : ``{"description", "required", "type", "security_impact": "true/false", "rationale": ""}``
- block : ``{"type": "block", "description", "required"}``  (no security fields)

Read-only (computed-only) attributes are skipped — they are not arguments a user sets.
"""

from typing import Any, Dict, Optional, Tuple

# Top-level Terraform meta-arguments that are not real resource arguments:
# ``timeouts`` (a meta-block) and ``id`` (the synthetic optional+computed resource ID).
DEFAULT_TOP_LEVEL_EXCLUDE = frozenset({"timeouts", "id"})

# Default placeholder values for the human-authored security fields on leaves.
# "true/false" signals an unreviewed boolean a contributor must set.
SECURITY_IMPACT_DEFAULT = "true/false"
RATIONALE_DEFAULT = ""


def render_type(t: Any) -> str:
    """Render a provider-schema type spec into a readable Terraform type string.

    Examples:
        "string"                          -> "string"
        ["map", "string"]                 -> "map(string)"
        ["set", "string"]                 -> "set(string)"
        ["list", ["object", {...}]]       -> "list(object)"
        ["object", {...}]                 -> "object"
    """
    if isinstance(t, str):
        return t
    if isinstance(t, list) and t:
        kind = t[0]
        if kind in ("list", "set", "map"):
            inner = render_type(t[1]) if len(t) > 1 else "dynamic"
            return f"{kind}({inner})"
        if kind == "object":
            return "object"
        if kind == "tuple":
            return "tuple"
    return "dynamic"


def _object_spec(t: Any) -> Optional[Tuple[Dict[str, Any], set]]:
    """If ``t`` is an object (or a collection of objects), return its fields.

    Returns a ``(fields, optional_field_names)`` tuple, or ``None`` if ``t`` is not an
    object type. The provider schema encodes an object as
    ``["object", {field: type, ...}]`` with an optional third element listing the
    names of optional fields; collections wrap an object as
    ``["list"/"set"/"map", ["object", {...}]]``.
    """
    if isinstance(t, list) and t:
        if t[0] == "object":
            fields = t[1] if len(t) > 1 and isinstance(t[1], dict) else {}
            optional = set(t[2]) if len(t) > 2 and isinstance(t[2], list) else set()
            return fields, optional
        if t[0] in ("list", "set", "map") and len(t) > 1:
            return _object_spec(t[1])
    return None


def _is_read_only(attr: Dict[str, Any]) -> bool:
    """True for computed-only attributes (outputs the user cannot set)."""
    return bool(attr.get("computed")) and not attr.get("optional") and not attr.get("required")


def _leaf_entry(description: str, required: bool, type_str: str) -> Dict[str, Any]:
    # Key order matches the spec: description, required, type, security_impact, rationale.
    return {
        "description": description,
        "required": required,
        "type": type_str,
        "security_impact": SECURITY_IMPACT_DEFAULT,
        "rationale": RATIONALE_DEFAULT,
    }


def _block_entry(description: str, required: bool) -> Dict[str, Any]:
    # Key order matches the spec: type, description, required (no security fields).
    return {
        "type": "block",
        "description": description,
        "required": required,
    }


def flatten_arguments(
    resource_block: Dict[str, Any],
    exclude_top: frozenset = DEFAULT_TOP_LEVEL_EXCLUDE,
) -> Dict[str, Any]:
    """Flatten a resource's schema ``block`` into a dotted-key arguments dict."""
    out: Dict[str, Any] = {}
    _flatten_block(resource_block or {}, "", out, exclude_top)
    return out


def _flatten_block(block: Dict[str, Any], prefix: str, out: Dict[str, Any], exclude: frozenset) -> None:
    for name, attr in (block.get("attributes") or {}).items():
        if not prefix and name in exclude:
            continue
        if _is_read_only(attr):
            continue
        path = prefix + name
        required = bool(attr.get("required"))
        description = attr.get("description") or ""
        spec = _object_spec(attr.get("type"))
        if spec:
            # Object-typed attribute behaves like a block of sub-arguments.
            out[path] = _block_entry(description, required)
            _flatten_object(spec[0], spec[1], path + ".", out)
        else:
            out[path] = _leaf_entry(description, required, render_type(attr.get("type")))

    for name, block_type in (block.get("block_types") or {}).items():
        if not prefix and name in exclude:
            continue
        path = prefix + name
        nested = block_type.get("block") or {}
        # A block is required only if it must appear at least once.
        required = bool(block_type.get("min_items"))
        description = nested.get("description") or ""
        out[path] = _block_entry(description, required)
        _flatten_block(nested, path + ".", out, exclude)


def _flatten_object(fields: Dict[str, Any], optional: set, prefix: str, out: Dict[str, Any]) -> None:
    """Flatten the fields of an object type. Object fields carry no description."""
    for fname, ftype in fields.items():
        path = prefix + fname
        required = fname not in optional
        spec = _object_spec(ftype)
        if spec:
            out[path] = _block_entry("", required)
            _flatten_object(spec[0], spec[1], path + ".", out)
        else:
            out[path] = _leaf_entry("", required, render_type(ftype))
