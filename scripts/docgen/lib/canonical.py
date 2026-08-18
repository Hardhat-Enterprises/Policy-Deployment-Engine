"""
Canonical (locked) security assessments for cross-cutting arguments.

Some arguments mean the same thing on every resource, so their `security_impact` and
`rationale` should be **identical everywhere** rather than assessed per-resource:

- **Data residency** — a resource's top-level `location` / `region` / `zone`.
- **IAM common keys** — on `*_iam_binding` / `*_iam_member` / `*_iam_policy` resources:
  `member`/`members`, `role`, `policy_data`, the `condition.*` fields, and the parent
  locator/identifier args.

These values are **prepopulated by the generator** for new resources and **overwrite**
any per-resource value on existing ones (canonical always wins), so a future linter can
assert they are present and unmodified.

The single source of truth is this module — `apply_canonical()` is called by the
generator and by the one-time applier over existing docs.
"""

from typing import Dict

# --- canonical rationales (the single source of truth) ---

RESIDENCY_RATIONALE = (
    "Determines the region/zone where the resource is created. Policy should restrict it "
    "to an approved-region whitelist for data residency; the allowed set is parameterised "
    "(a hardcoded example whitelist is acceptable)."
)
MEMBERS_RATIONALE = (
    "Controls which principals are granted access. Policy must block public principals "
    "(allUsers, allAuthenticatedUsers) and wildcard or over-broad grants; it must not "
    "dictate which specific users or groups a team may add."
)
ROLE_RATIONALE = (
    "Specifies the IAM role granted. Platform policy should not dictate which roles teams "
    "assign; access is constrained at the principal level (member/members) instead."
)
POLICY_DATA_RATIONALE = (
    "Carries a complete, free-form IAM policy document. Meaningfully constraining an "
    "arbitrary embedded policy with a generic platform rule is impractical, so it is out "
    "of scope."
)
CONDITION_RATIONALE = (
    "Defines a team-authored IAM condition (CEL expression and its title/description). "
    "Conditions are team-specific access logic, not a generic platform policy target."
)
LOCATOR_RATIONALE = (
    "Identifier referencing the target resource this binding applies to. Platform policy "
    "does not constrain resource names or references to other resources."
)

RESIDENCY_KEYS = ("location", "region", "zone")
IAM_SUFFIXES = ("_iam_binding", "_iam_member", "_iam_policy")
CONDITION_KEYS = ("condition.expression", "condition.title", "condition.description")


def is_iam_resource(resource_name: str) -> bool:
    """True for the split IAM resource variants whose common keys are canonical."""
    return resource_name.endswith(IAM_SUFFIXES)


def canonical_for(resource_name: str, key: str):
    """Return ``(security_impact, rationale)`` for a canonical key, or ``None``.

    ``key`` is the flat dotted argument key. ``resource_name`` is the full type
    (e.g. ``google_storage_bucket`` or ``google_storage_bucket_iam_binding``).
    """
    leaf = key.rsplit(".", 1)[-1]
    if is_iam_resource(resource_name):
        # Every leaf on an IAM resource is canonical (these resources only contain
        # principals, role, policy_data, condition fields, and parent locators).
        if key in CONDITION_KEYS:
            return (False, CONDITION_RATIONALE)
        if leaf in ("member", "members"):
            return (True, MEMBERS_RATIONALE)
        if leaf == "role":
            return (False, ROLE_RATIONALE)
        if leaf == "policy_data":
            return (False, POLICY_DATA_RATIONALE)
        return (False, LOCATOR_RATIONALE)
    # Non-IAM: only a resource's own top-level residency key is canonical.
    if "." not in key and key in RESIDENCY_KEYS:
        return (True, RESIDENCY_RATIONALE)
    return None


def apply_canonical(resource_name: str, arguments: Dict[str, dict]) -> int:
    """Overwrite canonical keys in ``arguments`` in place. Returns the number changed.

    Only leaf entries (those carrying a ``security_impact`` field) are touched; block
    entries are skipped.
    """
    changed = 0
    for key, entry in arguments.items():
        if not isinstance(entry, dict) or "security_impact" not in entry:
            continue
        canon = canonical_for(resource_name, key)
        if canon is None:
            continue
        si, rationale = canon
        if entry.get("security_impact") != si or entry.get("rationale") != rationale:
            changed += 1
        entry["security_impact"] = si
        entry["rationale"] = rationale
    return changed
