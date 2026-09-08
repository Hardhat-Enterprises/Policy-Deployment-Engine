package terraform.helpers_test

# Policy Orchestration Test Suite — unknown policy_type handling
#
# helpers.rego dispatches exactly six policy types. A policy naming a seventh
# used to build an {"error": ...} object and discard it: the object has no
# "name" key, so find_failing_resources intersected it into the empty set and
# the condition reported "None - All passed". These tests pin the replacement —
# get_multi_summary refuses the whole summary before evaluating anything.

import data.terraform.helpers
import rego.v1

# ==============================================================================
# MOCK DATA
# ==============================================================================
# Two buckets, one of which a working condition would flag. Deliberately shaped
# so a broken policy has something it *could* have caught: the point of these
# tests is that it reports an error rather than "All passed".

mock_variables := {
	"resource_type": "google_storage_bucket",
	"friendly_resource_name": "Storage Bucket",
	"resource_value_name": "name",
}

mock_input := {"planned_values": {"root_module": {"resources": [
	{"type": "google_storage_bucket", "values": {"name": "compliant_example_1", "location": "australia-southeast1"}},
	{"type": "google_storage_bucket", "values": {"name": "non_compliant_example_1", "location": "us-central1"}},
]}}}

meta := {"situation_description": "Buckets must be in an approved region.", "remedies": ["Move the bucket."]}

valid_condition := {
	"condition": "Location must be australia-southeast1",
	"attribute_path": ["location"],
	"values": ["australia-southeast1"],
	"policy_type": "whitelist",
}

# ==============================================================================
# UNIT TESTS: policy_type_problems
# ==============================================================================

test_no_problems_when_every_type_is_valid if {
	count(helpers.policy_type_problems([[meta, valid_condition]])) == 0
}

test_every_valid_type_is_accepted if {
	every t in helpers.valid_policy_types {
		count(helpers.policy_type_problems([[meta, {"attribute_path": ["x"], "values": ["y"], "policy_type": t}]])) == 0
	}
}

# The dispatch table and the accepted set must be the same six: a type listed as
# valid but with no select_policy_logic rule would evaluate to nothing at all.
test_valid_policy_types_is_exactly_the_six if {
	{t | some t in helpers.valid_policy_types} == {
		"blacklist", "whitelist", "range",
		"pattern blacklist", "pattern whitelist", "element blacklist",
	}
}

test_case_is_normalised_like_evaluate_conditions_does if {
	count(helpers.policy_type_problems([[meta, {"attribute_path": ["x"], "policy_type": "Pattern Whitelist"}]])) == 0
}

# The real offender shape found on dev: an underscore instead of a space.
test_underscored_type_is_a_problem if {
	helpers.policy_type_problems([[meta, {"attribute_path": ["x"], "policy_type": "pattern_whitelist"}]]) == {"unknown policy_type 'pattern_whitelist'"}
}

# The type the guide used to recommend, which never existed.
test_element_whitelist_is_a_problem if {
	helpers.policy_type_problems([[meta, {"attribute_path": ["x"], "policy_type": "element whitelist"}]]) == {"unknown policy_type 'element whitelist'"}
}

# lower() is undefined for a non-string, which would drop it from the set and
# leave it silently unevaluated by evaluate_conditions.
test_non_string_type_is_reported_not_dropped if {
	helpers.policy_type_problems([[meta, {"attribute_path": ["x"], "policy_type": 7}]]) == {"unknown policy_type '7'"}
}

# A check that forgot the key is skipped by evaluate_conditions just as silently.
test_missing_type_is_a_problem if {
	helpers.policy_type_problems([[meta, {"attribute_path": ["labels", "owner"], "values": ["a"]}]]) == {"no policy_type on the condition reading 'labels.owner'"}
}

# The metadata entry legitimately has no policy_type and no attribute_path.
test_metadata_entry_is_not_mistaken_for_an_untyped_condition if {
	count(helpers.policy_type_problems([[meta, valid_condition]])) == 0
}

# ==============================================================================
# INTEGRATION TESTS: get_multi_summary
# ==============================================================================

# The regression itself. A working condition alongside a broken one used to make
# the whole file pass: the working one flagged the non-compliant bucket, which
# was all auto_test looked for, and the broken one reported "All passed".
test_one_bad_type_refuses_the_whole_summary if {
	summary := helpers.get_multi_summary(
		[[meta, valid_condition], [meta, {"attribute_path": ["location"], "values": ["^.+$"], "policy_type": "pattern_whitelist"}]],
		mock_variables,
	) with input as mock_input

	count(summary.message) == 1
	startswith(summary.message[0], "POLICY ERROR:")
	contains(summary.message[0], "pattern_whitelist")
	summary.details == []
}

# The message must be actionable: what is wrong, what is allowed, what to do.
test_error_message_names_all_six_valid_types if {
	summary := helpers.get_multi_summary(
		[[meta, {"attribute_path": ["location"], "policy_type": "nonsense"}]],
		mock_variables,
	) with input as mock_input

	every t in helpers.valid_policy_types {
		contains(summary.message[0], t)
	}
}

# Every distinct bad type is listed, so fixing one does not just reveal the next.
test_multiple_bad_types_are_all_reported if {
	summary := helpers.get_multi_summary(
		[[meta, {"attribute_path": ["a"], "policy_type": "element whitelist"}, {"attribute_path": ["b"], "policy_type": "pattern_blacklist"}]],
		mock_variables,
	) with input as mock_input

	contains(summary.message[0], "element whitelist")
	contains(summary.message[0], "pattern_blacklist")
}

# The guard must not disturb a healthy policy.
test_valid_policy_still_produces_a_normal_summary if {
	summary := helpers.get_multi_summary([[meta, valid_condition]], mock_variables) with input as mock_input

	not startswith(summary.message[0], "POLICY ERROR:")
	summary.message[0] == "Total Storage Bucket detected: 2 "
	summary.details[0].non_compliant_resources == {"non_compliant_example_1"}
}
