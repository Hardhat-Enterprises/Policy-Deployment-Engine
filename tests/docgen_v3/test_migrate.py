"""Tests for legacy assessment migration into docs_v2."""

import json
import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v3.migrate_legacy_assessments import (
    Migration,
    coerce_security_impact,
    flatten_old,
    norm_type,
    split_slash_paths,
)


# --- pure helpers ---

def test_norm_type():
    assert norm_type("google_storage_bucket") == "storage_bucket"
    assert norm_type("storage_bucket") == "storage_bucket"
    assert norm_type("access_context_manager_service_perimeter.template") == \
        "access_context_manager_service_perimeter"


def test_split_slash_paths():
    assert split_slash_paths("role") == ["role"]
    assert split_slash_paths("member/members") == ["member", "members"]
    assert split_slash_paths("a.member/members.b") == ["a.member.b", "a.members.b"]


def test_coerce_security_impact():
    assert coerce_security_impact(True) == ("bool", True)
    assert coerce_security_impact(False) == ("bool", False)
    assert coerce_security_impact("true") == ("bool", True)
    assert coerce_security_impact(" False ") == ("bool", False)
    assert coerce_security_impact("high") == ("nonbool", "high")
    assert coerce_security_impact(None) == ("none", None)


def test_flatten_old_nested():
    args = {
        "name": {"security_impact": True, "rationale": "r"},
        "blk": {"security_impact": None, "arguments": {
            "leaf": {"security_impact": False, "rationale": ""}}},
    }
    flat = flatten_old(args)
    assert flat["name"] == (True, "r")
    assert flat["blk.leaf"] == (False, "")


# --- fixtures ---

def _v2_leaf(si="true/false", rat=""):
    return {"description": "d", "required": False, "type": "string",
            "security_impact": si, "rationale": rat}


def _write(path: Path, obj):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj), encoding="utf-8")


def _v2_doc(arguments):
    return {"last_updated": "x", "provider_version": "7.37.0", "arguments": arguments}


def _legacy_doc(resource_name, arguments):
    return {"resource_name": resource_name, "subcategory": "Svc", "arguments": arguments}


def _run(tmp_path, v2_files: dict, legacy_files: dict, apply=True):
    old = tmp_path / "old" / "gcp"
    new = tmp_path / "new" / "gcp"
    for name, args in v2_files.items():
        _write(new / "Svc" / f"{name}.json", _v2_doc(args))
    for name, (rn, args) in legacy_files.items():
        _write(old / "Svc" / f"{name}.json", _legacy_doc(rn, args))
    m = Migration(old, new).run()
    if apply:
        m.apply()
    return m, new


def _load(new, name):
    return json.loads((new / "Svc" / f"{name}.json").read_text())["arguments"]


# --- behavior ---

def test_exact_match_carries_boolean_and_rationale(tmp_path):
    m, new = _run(
        tmp_path,
        {"google_foo": {"location": _v2_leaf()}},
        {"foo": ("google_foo", {"location": {"security_impact": True, "rationale": "AU only",
                                             "compliant": "x", "parent": None}})},
    )
    loc = _load(new, "google_foo")["location"]
    assert loc["security_impact"] is True            # JSON boolean, not string
    assert loc["rationale"] == "AU only"
    assert "compliant" not in loc and "parent" not in loc   # legacy junk never added
    assert m.stats["placements_exact"] == 1


def test_unique_leaf_name_fallback(tmp_path):
    m, new = _run(
        tmp_path,
        {"google_fb": {"parent.child": _v2_leaf()}},
        {"fb": ("google_fb", {"child": {"security_impact": False, "rationale": ""}})},
    )
    assert _load(new, "google_fb")["parent.child"]["security_impact"] is False
    assert m.stats["placements_fallback"] == 1


def test_ambiguous_leaf_name_dropped(tmp_path):
    m, new = _run(
        tmp_path,
        {"google_amb": {"a.dup": _v2_leaf(), "b.dup": _v2_leaf()}},
        {"amb": ("google_amb", {"dup": {"security_impact": True, "rationale": ""}})},
    )
    assert _load(new, "google_amb")["a.dup"]["security_impact"] == "true/false"  # untouched
    assert m.stats["dropped_ambiguous"] == 1


def test_resource_missing_dropped(tmp_path):
    m, _ = _run(
        tmp_path,
        {"google_present": {"x": _v2_leaf()}},
        {"gone": ("google_gone", {"x": {"security_impact": True, "rationale": ""}})},
    )
    assert m.stats["dropped_resource_missing"] == 1
    assert m.dropped_resources == [("gone", 1)]


def test_true_false_string_coerced(tmp_path):
    _, new = _run(
        tmp_path,
        {"google_c": {"a": _v2_leaf(), "b": _v2_leaf()}},
        {"c": ("google_c", {"a": {"security_impact": "true", "rationale": ""},
                            "b": {"security_impact": "FALSE", "rationale": ""}})},
    )
    args = _load(new, "google_c")
    assert args["a"]["security_impact"] is True
    assert args["b"]["security_impact"] is False


def test_nonbool_string_dropped_but_rationale_carries(tmp_path):
    m, new = _run(
        tmp_path,
        {"google_n": {"a": _v2_leaf()}},
        {"n": ("google_n", {"a": {"security_impact": "high", "rationale": "matters"}})},
    )
    a = _load(new, "google_n")["a"]
    assert a["security_impact"] == "true/false"   # non-bool string NOT carried
    assert a["rationale"] == "matters"            # rationale still carried
    assert m.stats["dropped_nonbool_string"] == 1


def test_iam_single_file_maps_to_split(tmp_path):
    m, new = _run(
        tmp_path,
        {
            "google_bar_iam_binding": {"role": _v2_leaf(), "members": _v2_leaf(), "bucket": _v2_leaf()},
            "google_bar_iam_member": {"role": _v2_leaf(), "member": _v2_leaf(), "bucket": _v2_leaf()},
            "google_bar_iam_policy": {"role": _v2_leaf(), "policy_data": _v2_leaf(), "bucket": _v2_leaf()},
        },
        {"bar_iam": ("google_bar_iam", {
            "role": {"security_impact": True, "rationale": ""},
            "member/members": {"security_impact": False, "rationale": ""},
            "policy_data": {"security_impact": None, "rationale": "policy json"},
            "bucket": {"security_impact": True, "rationale": ""},
        })},
    )
    binding = _load(new, "google_bar_iam_binding")
    member = _load(new, "google_bar_iam_member")
    policy = _load(new, "google_bar_iam_policy")
    assert binding["role"]["security_impact"] is True       # role -> all three
    assert member["role"]["security_impact"] is True
    assert policy["role"]["security_impact"] is True
    assert binding["members"]["security_impact"] is False   # members -> binding only
    assert member["member"]["security_impact"] is False     # member -> member only
    assert policy["policy_data"]["rationale"] == "policy json"
    assert binding["bucket"]["security_impact"] is True


def test_parse_error_recorded(tmp_path):
    old = tmp_path / "old" / "gcp"
    new = tmp_path / "new" / "gcp"
    _write(new / "Svc" / "google_ok.json", _v2_doc({"x": _v2_leaf()}))
    (old / "Svc").mkdir(parents=True)
    (old / "Svc" / "broken.json").write_text("{not json", encoding="utf-8")
    m = Migration(old, new).run()
    assert m.stats["parse_error"] == 1


def test_bom_file_is_read(tmp_path):
    old = tmp_path / "old" / "gcp"
    new = tmp_path / "new" / "gcp"
    _write(new / "Svc" / "google_b.json", _v2_doc({"x": _v2_leaf()}))
    (old / "Svc").mkdir(parents=True)
    (old / "Svc" / "b.json").write_text(
        "﻿" + json.dumps(_legacy_doc("google_b", {"x": {"security_impact": True, "rationale": ""}})),
        encoding="utf-8",
    )
    m = Migration(old, new).run()
    m.apply()
    assert m.stats["parse_error"] == 0
    assert _load(new, "google_b")["x"]["security_impact"] is True
