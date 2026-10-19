"""The fix rules and the Terraform text patcher: pure text, no opa, no hcl2."""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.auto_remediation import main as ar  # noqa: E402


def cond(policy_type, values, attribute_path=("attr",)):
    return {"policy_type": policy_type, "values": list(values), "attribute_path": list(attribute_path)}


class TestComputeFix:
    def test_whitelist_scalar_takes_the_first_value(self):
        fix = ar.compute_fix(cond("whitelist", ["australia-southeast1", "australia-southeast2"]), "us-central1")
        assert fix.fixable
        assert fix.new_value == "australia-southeast1"

    def test_whitelist_list_keeps_only_allowed_elements(self):
        fix = ar.compute_fix(cond("whitelist", ["a", "b"]), ["a", "x", "b", "y"])
        assert fix.fixable
        assert fix.new_value == ["a", "b"]

    def test_whitelist_list_falls_back_to_the_first_value_when_nothing_is_left(self):
        fix = ar.compute_fix(cond("whitelist", ["a", "b"]), ["x", "y"])
        assert fix.fixable
        assert fix.new_value == ["a"]

    def test_whitelist_without_values_is_not_fixable(self):
        assert not ar.compute_fix(cond("whitelist", []), "x").fixable

    def test_blacklist_boolean_is_flipped(self):
        fix = ar.compute_fix(cond("blacklist", [False]), False)
        assert fix.fixable
        assert fix.new_value is True
        assert ar.compute_fix(cond("blacklist", [True]), True).new_value is False

    def test_blacklist_non_boolean_scalar_needs_manual_review(self):
        fix = ar.compute_fix(cond("blacklist", ["us-old-region"]), "us-old-region")
        assert not fix.fixable
        assert "needs a human" in fix.reason

    def test_blacklist_list_drops_forbidden_elements(self):
        fix = ar.compute_fix(cond("blacklist", ["0.0.0.0/0"]), ["10.0.0.0/8", "0.0.0.0/0"])
        assert fix.fixable
        assert fix.new_value == ["10.0.0.0/8"]

    def test_blacklist_of_an_absent_value_needs_manual_review(self):
        assert not ar.compute_fix(cond("blacklist", [None, ""]), None).fixable

    def test_range_clamps_to_the_violated_bound(self):
        assert ar.compute_fix(cond("range", [1, 10]), 0).new_value == 1
        assert ar.compute_fix(cond("range", [1, 10]), 99).new_value == 10

    def test_other_policy_types_are_not_fixable(self):
        assert not ar.compute_fix(cond("pattern whitelist", ["^a"]), "b").fixable


TF = '''resource "google_example" "non_compliant_example_1" {
  name   = "x"
  region = "us-central1"

  properties {
    tier = "BASIC"
    backup {
      enabled = false
    }
  }
}

resource "google_example" "other" {
  region = "us-central1"
}
'''


class TestPatchTfAttribute:
    def test_scalar_attribute_of_the_named_resource_only(self):
        text, ok = ar.patch_tf_attribute(TF, "google_example", "non_compliant_example_1", ["region"], "australia-southeast1")
        assert ok
        assert 'region = "australia-southeast1"' in text
        # The other resource is untouched.
        assert text.endswith('resource "google_example" "other" {\n  region = "us-central1"\n}\n')

    def test_attribute_inside_a_nested_block(self):
        # Plan JSON paths carry a block index; it is not a text token.
        text, ok = ar.patch_tf_attribute(
            TF, "google_example", "non_compliant_example_1", ["properties", 0, "backup", 0, "enabled"], True
        )
        assert ok
        assert "enabled = true" in text
        assert "enabled = false" not in text
        assert 'tier = "BASIC"' in text

    def test_a_missing_attribute_is_added_to_its_block(self):
        text, ok = ar.patch_tf_attribute(TF, "google_example", "non_compliant_example_1", ["properties", 0, "size"], 5)
        assert ok
        assert "size = 5" in text

    def test_a_missing_block_is_not_invented(self):
        text, ok = ar.patch_tf_attribute(TF, "google_example", "non_compliant_example_1", ["missing", 0, "x"], 1)
        assert not ok
        assert text == TF

    def test_an_unknown_resource_is_not_patched(self):
        assert ar.patch_tf_attribute(TF, "google_example", "nope", ["region"], "x") == (TF, False)

    def test_a_heredoc_value_is_replaced_whole(self):
        tf = (
            'resource "google_example" "c" {\n'
            '  name        = "c"\n'
            '  private_key = <<-EOT\n'
            '    -----BEGIN PRIVATE KEY-----\n'
            '    abc\n'
            '    -----END PRIVATE KEY-----\n'
            '  EOT\n'
            '  region = "us-central1"\n'
            '}\n'
        )
        text, ok = ar.patch_tf_attribute(tf, "google_example", "c", ["private_key"], "projects/p/secrets/s")
        assert ok
        assert "BEGIN PRIVATE KEY" not in text
        assert "EOT" not in text
        assert 'private_key = "projects/p/secrets/s"\n  region = "us-central1"' in text

    def test_lists_are_written_as_hcl(self):
        text, ok = ar.patch_tf_attribute(TF, "google_example", "other", ["region"], ["a", "b"])
        assert ok
        assert 'region = ["a", "b"]' in text


class TestPolicyError:
    def test_found_at_any_depth_from_the_marker_on(self):
        assert ar.find_policy_error(["POLICY ERROR: bad values. Nothing was checked."]) == (
            "POLICY ERROR: bad values. Nothing was checked."
        )
        assert ar.find_policy_error([["x", ["note: POLICY ERROR: deep "]]]) == "POLICY ERROR: deep"
        assert ar.find_policy_error({"message": ["POLICY ERROR: in a dict"]}) == "POLICY ERROR: in a dict"

    def test_a_normal_message_has_none(self):
        assert ar.find_policy_error(["Total X detected: 1 ", ["Situation 1: x", "Non-Compliant Resources: a"]]) is None
        assert ar.find_policy_error(None) is None
