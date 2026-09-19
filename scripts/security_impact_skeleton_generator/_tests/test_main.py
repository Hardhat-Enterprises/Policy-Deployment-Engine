import pytest

from scripts.security_impact_skeleton_generator.main import (
    find_security_impact_arguments,
    get_required_paths,
    parse_target,
    render_template,
    service_slug,
)


def test_parse_target_valid():
    result = parse_target(
        "gcp/Cloud IAM/google_iam_example"
    )

    assert result == [
        "gcp",
        "Cloud IAM",
        "google_iam_example",
    ]


def test_parse_target_invalid():
    with pytest.raises(ValueError):
        parse_target(
            "gcp/google_iam_example"
        )


def test_find_security_impact_arguments():
    document = {
        "arguments": {
            "secure_setting": {
                "security_impact": True,
            },
            "normal_setting": {
                "security_impact": False,
            },
            "parent_block": {
                "type": "block",
            },
            "nested.enabled": {
                "security_impact": True,
            },
        }
    }

    result = find_security_impact_arguments(
        document
    )

    assert result == [
        "secure_setting",
        "nested.enabled",
    ]


def test_service_slug_conversion():
    assert (
        service_slug("Cloud IAM")
        == "cloud_iam"
    )

    assert (
        service_slug("Cloud Run (v2 API)")
        == "cloud_run_v2_api"
    )


def test_get_required_paths():
    paths = get_required_paths(
        "gcp",
        "Cloud IAM",
        "google_test_resource",
        "secure_setting",
    )

    assert str(
        paths["compliant.tf"]
    ).endswith(
        (
            "inputs/gcp/Cloud IAM/"
            "google_test_resource/"
            "secure_setting/compliant.tf"
        )
    )

    assert str(
        paths["policy.rego"]
    ).endswith(
        (
            "policies/gcp/Cloud IAM/"
            "google_test_resource/"
            "secure_setting.rego"
        )
    )

    assert str(
        paths["_vars.rego"]
    ).endswith(
        (
            "policies/gcp/Cloud IAM/"
            "google_test_resource/"
            "_vars.rego"
        )
    )


def test_render_template_replaces_placeholders(
    tmp_path,
):
    template = (
        tmp_path / "template.rego"
    )

    destination = (
        tmp_path / "output.rego"
    )

    template.write_text(
        (
            "package terraform.gcp.security."
            "<service>.<resource_type>."
            "<policy_name>\n"
            '"resource_type":  ""\n'
            'resource "RESOURCE_TYPE" "example" {}\n'
        ),
        encoding="utf-8",
    )

    created = render_template(
        template,
        destination,
        service="Cloud IAM",
        resource="google_test_resource",
        policy_name="secure_setting",
    )

    assert created is True

    content = destination.read_text(
        encoding="utf-8"
    )

    assert (
        "terraform.gcp.security.cloud_iam."
        "google_test_resource.secure_setting"
        in content
    )

    assert (
        '"resource_type": '
        '"google_test_resource"'
        in content
    )

    assert (
        'resource "google_test_resource" '
        '"example"'
        in content
    )


def test_render_template_does_not_overwrite(
    tmp_path,
):
    template = (
        tmp_path / "template.txt"
    )

    destination = (
        tmp_path / "existing.txt"
    )

    template.write_text(
        "new content",
        encoding="utf-8",
    )

    destination.write_text(
        "existing contributor work",
        encoding="utf-8",
    )

    created = render_template(
        template,
        destination,
    )

    assert created is False

    assert destination.read_text(
        encoding="utf-8"
    ) == "existing contributor work"