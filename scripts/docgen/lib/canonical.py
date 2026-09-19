"""
Canonical (locked) security assessments for cross-cutting arguments.

Some arguments mean the same thing on every resource, so their `security_impact` and
`rationale` should be **identical everywhere** rather than assessed per-resource:

- **Data residency** — a resource's top-level `location` / `region` / `zone`.
- **IAM common keys** — on `*_iam_binding` / `*_iam_member` / `*_iam_policy` resources:
  `member`/`members`, `role`, `policy_data`, the `condition.*` fields, and the parent
  locator/identifier args.

These values are **prepopulated by the generator** for new resources and **overwrite**
any per-resource value on existing ones (canonical always wins), so the linter can assert
they are present and unmodified (`linter.py`, docs content checks).

Not every resource's residency key is a residency *decision*, though, so `EXEMPTIONS`
below records the ones where the generic answer would be wrong — with the correct answer,
not a licence to write anything. An exempt key is still locked; it is locked to a
different value. That distinction is the whole point: "canonical always wins" only stays
true if canonical can be right about the exceptions too.

The single source of truth is this module — `apply_canonical()` is called by the
generator, by the applier over existing docs, and by the linter that checks them.
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

# --- exemptions: where the generic residency answer is wrong -----------------
#
# Both categories share a shape: the key exists, but its value is not this resource's
# choice to make. Policing it would either constrain nothing (the API accepts one
# value) or re-police a decision another resource already fixed. Marking those
# `security_impact: true` and asking for a region whitelist would send a contributor
# looking for a control that cannot exist.
#
# Adding an entry is a deliberate act: it needs the resource, the key, and a rationale
# that says *why this one is different*. Everything not listed stays canonical.

RESIDENCY_FIXED_RATIONALE = (
    "Specifies the IAM policy-binding location. These policy bindings use the global IAM "
    "location, so there is no meaningful regional data-residency choice for a platform "
    "whitelist to constrain."
)
PER_INSTANCE_CONFIG_ZONE_RATIONALE = (
    "This doesn't choose where the instance is provisioned — it must match wherever the "
    "referenced instance_group_manager already lives; the resource doesn't create a new "
    "location, it addresses an existing one. The actual data-residency decision belongs to "
    "the instance_group_manager (or region_instance_group_manager) resource being "
    "referenced, so a whitelist here would just be re-policing a value that resource "
    "already fixed, not an independent architecture choice of this resource's own."
)

# (resource_type, flat argument key) -> (security_impact, rationale)
EXEMPTIONS = {
    # The API accepts only "global" here, so there is no region to whitelist.
    ("google_iam_folders_policy_binding", "location"):
        (False, RESIDENCY_FIXED_RATIONALE),
    ("google_iam_organizations_policy_binding", "location"):
        (False, RESIDENCY_FIXED_RATIONALE),
    # Mirrors the zone of the instance group manager it references.
    ("google_compute_per_instance_config", "zone"):
        (False, PER_INSTANCE_CONFIG_ZONE_RATIONALE),
}

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
    # Exemptions first: a resource listed here has a different *correct* answer, not
    # an absent one, so it must not fall through to the generic rules below.
    exempt = EXEMPTIONS.get((resource_name, key))
    if exempt is not None:
        return exempt

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
