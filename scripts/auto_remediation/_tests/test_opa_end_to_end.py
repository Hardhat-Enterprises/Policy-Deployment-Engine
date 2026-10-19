"""Through the real opa binary (skipped without it). The validate-repo case also
needs python-hcl2 (skipped without it; CI does not install it)."""

import json
import re
import shutil
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_remediation import main as ar  # noqa: E402

pytestmark = pytest.mark.skipif(shutil.which("opa") is None, reason="opa is not on PATH")

REDIS = project_root / "policies" / "gcp" / "Memorystore (Redis)" / "google_redis_instance"


def redis_policy(argument: str) -> ar.Policy:
    return next(p for p in ar.discover_policies(project_root) if p.rego_path == REDIS / argument / "policy.rego")


def committed_plan(argument: str) -> dict:
    plan = next((REDIS / argument).glob("*.json"))
    return json.loads(plan.read_text())


def test_conditions_and_details_come_from_the_policy_alone():
    policy = redis_policy("region")
    package = ar.eval_package(policy, "opa", committed_plan("region"))
    conds = ar.parse_conditions(package["conditions"])
    assert [c["policy_type"] for c in conds] == ["whitelist"]
    assert conds[0]["attribute_path"] == ["region"]
    flagged = [name for situation in package["details"] for name in situation.get("non_compliant_resources", [])]
    assert flagged == ["non-compliant-example-1"]
    assert ar.find_policy_error(package.get("message")) is None


def test_a_policy_the_helpers_refuse_reports_policy_error(tmp_path):
    resource = tmp_path / "policies" / "gcp" / "Test" / "google_redis_instance"
    (resource / "refused").mkdir(parents=True)
    (tmp_path / "policies" / "_helpers").symlink_to(project_root / "policies" / "_helpers")
    shutil.copy(REDIS / "_vars.rego", resource / "_vars.rego")
    (resource / "refused" / "policy.rego").write_text(
        "package terraform.gcp.security.memorystore_redis.google_redis_instance.refused\n\n"
        "import data.terraform.helpers\n"
        "import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars\n\n"
        'conditions := [[\n  {"situation_description": "x", "remedies": ["y"]},\n'
        '  {"condition": "c", "attribute_path": ["region"], "values": [], "policy_type": "element required"}\n]]\n\n'
        "result := helpers.get_multi_summary(conditions, vars.variables)\n"
        "message := result.message\ndetails := result.details\n"
    )
    (policy,) = ar.discover_policies(tmp_path)
    package = ar.eval_package(policy, "opa", committed_plan("region"))
    assert ar.find_policy_error(package.get("message")).startswith("POLICY ERROR: invalid element required values")


def test_validate_repo_fixes_and_reverifies_redis(tmp_path, capsys):
    pytest.importorskip("hcl2")
    log = tmp_path / "log.json"
    fixed = tmp_path / "fixed"
    ar.cmd_validate_repo(SimpleNamespace(repo=str(project_root), only="google_redis_instance", limit=0,
                                         log_out=str(log), write_fixed_to=str(fixed), opa_bin="opa"))
    stats = json.loads(log.read_text())["stats"]
    assert stats["eval_error"] == 0
    assert stats["auto_fixed_and_reverified_compliant"] >= 5
    assert stats["auto_fixed_but_still_noncompliant"] == 0
    # BEFORE/AFTER pairs mirror the policies/ tree, outside the repo.
    after = fixed / "gcp" / "Memorystore (Redis)" / "google_redis_instance" / "region" / "AFTER_fixed.tf"
    assert re.search(r'region\s*=\s*"australia-southeast1"', after.read_text())
