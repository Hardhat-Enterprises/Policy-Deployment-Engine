"""Tests for canonical (locked) cross-cutting assessments."""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen.lib.canonical import (
    CONDITION_RATIONALE,
    EXEMPTIONS,
    PER_INSTANCE_CONFIG_ZONE_RATIONALE,
    RESIDENCY_FIXED_RATIONALE,
    LOCATOR_RATIONALE,
    MEMBERS_RATIONALE,
    POLICY_DATA_RATIONALE,
    RESIDENCY_RATIONALE,
    ROLE_RATIONALE,
    apply_canonical,
    canonical_for,
    is_iam_resource,
)


def test_is_iam_resource():
    assert is_iam_resource("google_storage_bucket_iam_binding")
    assert is_iam_resource("google_x_iam_member")
    assert is_iam_resource("google_x_iam_policy")
    assert not is_iam_resource("google_storage_bucket")


def test_canonical_iam_keys():
    r = "google_storage_bucket_iam_binding"
    assert canonical_for(r, "members") == (True, MEMBERS_RATIONALE)
    assert canonical_for(r, "member") == (True, MEMBERS_RATIONALE)
    assert canonical_for(r, "role") == (False, ROLE_RATIONALE)
    assert canonical_for(r, "policy_data") == (False, POLICY_DATA_RATIONALE)
    assert canonical_for(r, "condition.expression") == (False, CONDITION_RATIONALE)
    assert canonical_for(r, "condition.title") == (False, CONDITION_RATIONALE)
    assert canonical_for(r, "bucket") == (False, LOCATOR_RATIONALE)   # parent locator


def test_canonical_residency_non_iam():
    r = "google_storage_bucket"
    assert canonical_for(r, "location") == (True, RESIDENCY_RATIONALE)
    assert canonical_for(r, "region") == (True, RESIDENCY_RATIONALE)
    assert canonical_for(r, "zone") == (True, RESIDENCY_RATIONALE)
    # nested location-named field is NOT the resource's own residency
    assert canonical_for(r, "node_config.location") is None
    # unrelated key
    assert canonical_for(r, "force_destroy") is None


def test_residency_not_applied_inside_iam():
    # in an IAM resource, location/region/zone are locators -> false, not residency
    assert canonical_for("google_x_iam_member", "region") == (False, LOCATOR_RATIONALE)


def _leaf(si="true/false", rat=""):
    return {"description": "d", "required": False, "type": "string",
            "security_impact": si, "rationale": rat}


def test_apply_canonical_overwrites_and_counts():
    args = {
        "location": _leaf(si=False, rat="old custom"),   # will be overwritten to canonical
        "force_destroy": _leaf(si=True, rat="keep me"),   # untouched
        "blk": {"type": "block", "description": "", "required": False},  # skipped
    }
    n = apply_canonical("google_storage_bucket", args)
    assert n == 1
    assert args["location"]["security_impact"] is True
    assert args["location"]["rationale"] == RESIDENCY_RATIONALE
    assert args["force_destroy"] == {"description": "d", "required": False, "type": "string",
                                     "security_impact": True, "rationale": "keep me"}
    assert "security_impact" not in args["blk"]


def test_apply_canonical_iam_full_coverage():
    args = {
        "members": _leaf(),
        "role": _leaf(si=True, rat="wrong"),
        "policy_data": _leaf(),
        "condition.expression": _leaf(si=True),
        "bucket": _leaf(si=True),
    }
    apply_canonical("google_storage_bucket_iam_binding", args)
    assert args["members"]["security_impact"] is True
    assert args["role"]["security_impact"] is False and args["role"]["rationale"] == ROLE_RATIONALE
    assert args["policy_data"]["security_impact"] is False
    assert args["condition.expression"]["security_impact"] is False
    assert args["bucket"]["security_impact"] is False


def test_apply_canonical_idempotent():
    args = {"location": _leaf()}
    apply_canonical("google_x", args)
    assert apply_canonical("google_x", args) == 0   # second pass changes nothing


# --------------------------------------------------------------------------- #
# Exemptions: resources whose residency key is not a residency decision.
# --------------------------------------------------------------------------- #
def test_an_exempt_key_gets_its_own_locked_answer():
    # Not "no answer" — a different one. The key stays locked, which is what lets
    # the linter check every resource without carving a hole for these.
    assert canonical_for("google_iam_folders_policy_binding", "location") == (
        False, RESIDENCY_FIXED_RATIONALE)
    assert canonical_for("google_compute_per_instance_config", "zone") == (
        False, PER_INSTANCE_CONFIG_ZONE_RATIONALE)


def test_the_same_key_elsewhere_is_still_generic():
    # The exemption is per resource, not per key name: `location` on anything not
    # listed is still a data-residency decision.
    assert canonical_for("google_storage_bucket", "location") == (True, RESIDENCY_RATIONALE)
    assert canonical_for("google_compute_instance", "zone") == (True, RESIDENCY_RATIONALE)


def test_exemptions_are_checked_before_every_other_rule():
    # google_iam_folders_policy_binding does not end in _iam_binding, so it reaches
    # the residency branch. If the lookup ran later it would be overwritten there.
    assert canonical_for("google_iam_folders_policy_binding", "location")[0] is False


def test_apply_canonical_leaves_a_correct_exempt_entry_alone():
    args = {"location": {"security_impact": False, "rationale": RESIDENCY_FIXED_RATIONALE}}
    assert apply_canonical("google_iam_folders_policy_binding", args) == 0
    assert args["location"]["rationale"] == RESIDENCY_FIXED_RATIONALE


def test_apply_canonical_restores_an_exempt_entry_that_drifted():
    args = {"location": {"security_impact": True, "rationale": "wrong"}}
    assert apply_canonical("google_iam_folders_policy_binding", args) == 1
    assert args["location"] == {"security_impact": False,
                                "rationale": RESIDENCY_FIXED_RATIONALE}


def test_every_exemption_records_a_real_answer():
    # An entry with an empty rationale would be an exemption in name only — a way to
    # opt out of the check rather than to record a better answer.
    for (resource, key), (impact, rationale) in EXEMPTIONS.items():
        assert isinstance(resource, str) and resource.startswith("google_")
        assert isinstance(key, str) and key
        assert isinstance(impact, bool)
        assert isinstance(rationale, str) and len(rationale.strip()) > 40, (resource, key)
