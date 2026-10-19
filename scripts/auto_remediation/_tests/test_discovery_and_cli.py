"""Discovery on the real per-argument tree, the OPA data files, and the CLI. No opa needed."""

import sys
from pathlib import Path

import pytest

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_remediation import main as ar  # noqa: E402

REDIS = project_root / "policies" / "gcp" / "Memorystore (Redis)" / "google_redis_instance"


@pytest.fixture(scope="module")
def policies():
    return ar.discover_policies(project_root)


def test_every_policy_rego_is_found_and_nothing_else(policies):
    expected = sorted(
        p for p in (project_root / "policies").rglob("policy.rego") if "_helpers" not in p.parts
    )
    assert [p.rego_path for p in policies] == expected
    assert len(policies) > 1800


def test_a_policy_on_the_per_argument_layout(policies):
    region = next(p for p in policies if p.rego_path == REDIS / "region" / "policy.rego")
    assert region.package == "terraform.gcp.security.memorystore_redis.google_redis_instance.region"
    assert region.resource_dir == REDIS
    assert region.vars_path == REDIS / "_vars.rego"
    assert region.argument == "region"
    assert region.argument_dir == REDIS / "region"
    assert region.resource_type == "google_redis_instance"
    assert (region.platform, region.service, region.resource) == ("gcp", "Memorystore (Redis)", "google_redis_instance")


def test_dotted_argument_folders_keep_their_name(policies):
    dotted = [p for p in policies if p.resource_type == "google_storage_batch_operations_job"]
    assert "rewrite_object.kms_key" in {p.argument for p in dotted}


def test_opa_data_is_explicit_files_never_a_folder(policies):
    region = next(p for p in policies if p.rego_path == REDIS / "region" / "policy.rego")
    paths = region.data_paths()
    assert paths == [project_root / "policies" / "_helpers", REDIS / "region" / "policy.rego", REDIS / "_vars.rego"]
    # Neither the resource folder (sibling policies) nor any <sha>.json fixture plan.
    assert REDIS not in paths
    assert not any(p.suffix == ".json" for p in paths)


def test_content_security_policies_are_recognised(policies):
    ces = {p.argument for p in policies if p.resource_type == "google_ces_agent" and ar.needs_content_analysis(p.rego_path)}
    assert ces == {
        "after_agent_callbacks.python_code",
        "after_model_callbacks.python_code",
        "after_tool_callbacks.python_code",
        "before_agent_callbacks.python_code",
        "before_model_callbacks.python_code",
        "before_tool_callbacks.python_code",
    }
    assert not ar.needs_content_analysis(REDIS / "region" / "policy.rego")


class TestOpaBinOption:
    def test_default_is_opa_on_path(self):
        assert ar.build_parser().parse_args(["discover", "--repo", "."]).opa_bin == "opa"

    def test_before_the_subcommand_is_not_overwritten(self):
        args = ar.build_parser().parse_args(["--opa-bin", "/x/opa", "discover", "--repo", "."])
        assert args.opa_bin == "/x/opa"

    def test_after_the_subcommand(self):
        args = ar.build_parser().parse_args(["validate-repo", "--repo", ".", "--opa-bin", "/y/opa"])
        assert args.opa_bin == "/y/opa"

    def test_after_wins_over_before(self):
        args = ar.build_parser().parse_args(["--opa-bin", "/x/opa", "remediate", "--repo", ".", "--plan", "p.json",
                                             "--tf-dir", "tf", "--opa-bin", "/y/opa"])
        assert args.opa_bin == "/y/opa"

    def test_remediate_is_a_dry_run_by_default(self):
        args = ar.build_parser().parse_args(["remediate", "--repo", ".", "--plan", "p.json", "--tf-dir", "tf"])
        assert args.apply is False


def test_a_missing_opa_gives_one_clear_platform_neutral_message(capsys):
    assert ar.main(["--opa-bin", "/definitely/not/opa", "discover", "--repo", "."]) == 1
    err = capsys.readouterr().err
    assert "opa not found" in err
    assert "--opa-bin" in err
    for windows_only in ("Unblock-File", "dir ", "opa.exe"):
        assert windows_only not in err
