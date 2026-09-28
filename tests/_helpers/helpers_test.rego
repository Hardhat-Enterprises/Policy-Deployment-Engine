package terraform.helpers_test

# Policy Orchestration Test Suite — unknown policy_type handling
#
# helpers.rego dispatches the supported policy types. A policy naming an unknown type
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

# The dispatch table and the accepted set must agree: a type listed as
# valid but with no select_policy_logic rule would evaluate to nothing at all.
test_valid_policy_types_matches_supported_set if {
	{t | some t in helpers.valid_policy_types} == {
		"blacklist", "whitelist", "range",
		"pattern blacklist", "pattern whitelist", "element blacklist",
		"element pattern whitelist",
		"map key blacklist",
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
test_error_message_names_all_valid_types if {
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

# ==============================================================================
# SITUATION "match": combining a situation's conditions with ANY or ALL
# ==============================================================================
# The worked case is a Vertex AI endpoint kept private either by VPC peering
# (`network`) or by Private Service Connect — two conditions, neither wrong on
# its own, and only an endpoint that fails BOTH is actually public. Under the
# default union all three resources below are flagged, which is why the key
# exists.

endpoint_variables := {
	"resource_type": "google_vertex_ai_endpoint",
	"friendly_resource_name": "Vertex AI Endpoint",
	"resource_value_name": "name",
}

# vpc_only     — peered, no PSC        -> fails the PSC condition only
# psc_only     — PSC on, no network    -> fails the network condition only
# neither      — no network, no PSC    -> fails both; the only truly public one
endpoint_input := {"planned_values": {"root_module": {"resources": [
	{"type": "google_vertex_ai_endpoint", "values": {
		"name": "vpc_only",
		"network": "projects/1/global/networks/vpc",
		"private_service_connect_config": [{"enable_private_service_connect": false}],
	}},
	{"type": "google_vertex_ai_endpoint", "values": {
		"name": "psc_only",
		"network": "",
		"private_service_connect_config": [{"enable_private_service_connect": true}],
	}},
	{"type": "google_vertex_ai_endpoint", "values": {
		"name": "neither",
		"network": "",
		"private_service_connect_config": [{"enable_private_service_connect": false}],
	}},
]}}}

network_condition := {
	"condition": "No VPC peering network is set",
	"attribute_path": ["network"],
	"values": [null, ""],
	"policy_type": "blacklist",
}

psc_condition := {
	"condition": "Private Service Connect is not enabled",
	"attribute_path": ["private_service_connect_config", 0, "enable_private_service_connect"],
	"values": [true],
	"policy_type": "whitelist",
}

exclusive_meta := {
	"situation_description": "Endpoint is reachable from the public internet.",
	"remedies": ["Set network for VPC peering, or enable Private Service Connect."],
}

# ------------------------------------------------------------------------------
# The default is untouched. This is the test that must never be "fixed": every
# policy written before `match` existed relies on it.
# ------------------------------------------------------------------------------
test_no_match_key_still_unions_the_conditions if {
	summary := helpers.get_multi_summary(
		[[exclusive_meta, network_condition, psc_condition]],
		endpoint_variables,
	) with input as endpoint_input

	summary.details[0].non_compliant_resources == {"vpc_only", "psc_only", "neither"}
}

test_match_any_is_explicitly_the_same_as_omitting_it if {
	with_key := helpers.get_multi_summary(
		[[object.union(exclusive_meta, {"match": "any"}), network_condition, psc_condition]],
		endpoint_variables,
	) with input as endpoint_input

	without_key := helpers.get_multi_summary(
		[[exclusive_meta, network_condition, psc_condition]],
		endpoint_variables,
	) with input as endpoint_input

	with_key.details[0].non_compliant_resources == without_key.details[0].non_compliant_resources
}

# ------------------------------------------------------------------------------
# The new mode: the three-resource table from the handoff.
# ------------------------------------------------------------------------------
test_match_all_flags_only_the_resource_that_fails_every_condition if {
	summary := helpers.get_multi_summary(
		[[object.union(exclusive_meta, {"match": "all"}), network_condition, psc_condition]],
		endpoint_variables,
	) with input as endpoint_input

	summary.details[0].non_compliant_resources == {"neither"}
}

test_match_all_is_case_insensitive_like_policy_type if {
	summary := helpers.get_multi_summary(
		[[object.union(exclusive_meta, {"match": "ALL"}), network_condition, psc_condition]],
		endpoint_variables,
	) with input as endpoint_input

	summary.details[0].non_compliant_resources == {"neither"}
}

# One condition intersects to itself — "all" must not be a special case that
# only works with two or more.
test_match_all_with_a_single_condition_matches_that_condition if {
	summary := helpers.get_multi_summary(
		[[object.union(exclusive_meta, {"match": "all"}), network_condition]],
		endpoint_variables,
	) with input as endpoint_input

	summary.details[0].non_compliant_resources == {"psc_only", "neither"}
}

# Situations remain alternatives (OR) regardless of how each combines inside.
test_match_is_per_situation_not_per_policy if {
	summary := helpers.get_multi_summary(
		[
			[object.union(exclusive_meta, {"match": "all"}), network_condition, psc_condition],
			[meta, network_condition],
		],
		endpoint_variables,
	) with input as endpoint_input

	summary.details[0].non_compliant_resources == {"neither"}
	summary.details[1].non_compliant_resources == {"psc_only", "neither"}
}

# ------------------------------------------------------------------------------
# find_failing_resources directly — the shape difference between the two modes.
# ------------------------------------------------------------------------------
two_condition_results := [
	{"first": {{"name": "a", "message": "m"}, {"name": "b", "message": "m"}}},
	{"second": {{"name": "b", "message": "m"}, {"name": "c", "message": "m"}}},
]

test_find_failing_resources_any_unions if {
	helpers.find_failing_resources(two_condition_results, "any") == {"a", "b", "c"}
}

test_find_failing_resources_all_intersects if {
	helpers.find_failing_resources(two_condition_results, "all") == {"b"}
}

test_find_failing_resources_all_of_nothing_is_empty if {
	helpers.find_failing_resources([], "all") == set()
}

# A condition that flagged nothing empties the intersection — the under-flag the
# comment on find_failing_resources warns about, pinned so it is a known
# property rather than a surprise.
test_match_all_is_empty_when_one_condition_flags_nothing if {
	helpers.find_failing_resources(
		[{"first": {{"name": "a", "message": "m"}}}, {"second": set()}],
		"all",
	) == set()
}

# ==============================================================================
# UNIT TESTS: match_problems
# ==============================================================================

test_absent_match_is_not_a_problem if {
	count(helpers.match_problems([[meta, valid_condition]])) == 0
}

test_both_valid_match_values_are_accepted if {
	every m in helpers.valid_match_values {
		count(helpers.match_problems([[object.union(meta, {"match": m}), valid_condition]])) == 0
	}
}

test_unknown_match_is_a_problem_and_names_the_situation if {
	helpers.match_problems([[object.union(meta, {"match": "both"}), valid_condition]]) == {
		"unknown match 'both' on the situation 'Buckets must be in an approved region.'",
	}
}

# Writing the key at all is a choice, so null is reported rather than read as
# "absent" — otherwise a typo'd key silently reverts to the default.
test_null_match_is_a_problem if {
	count(helpers.match_problems([[object.union(meta, {"match": null}), valid_condition]])) == 1
}

test_non_string_match_is_reported_not_dropped if {
	helpers.match_problems([[object.union(meta, {"match": 7}), valid_condition]]) == {
		"unknown match '7' on the situation 'Buckets must be in an approved region.'",
	}
}

test_unnamed_situation_is_still_identifiable if {
	helpers.match_problems([[{"match": "nope"}, valid_condition]]) == {
		"unknown match 'nope' on the situation '(no situation_description)'",
	}
}

# ==============================================================================
# INTEGRATION: an unknown match refuses the summary, like an unknown policy_type
# ==============================================================================

# The failure mode being prevented: find_failing_resources has no rule for
# "both", so build_single_situation would be undefined and the comprehension in
# build_situation_results would drop the situation without a word.
test_unknown_match_refuses_the_whole_summary if {
	summary := helpers.get_multi_summary(
		[[object.union(meta, {"match": "both"}), valid_condition]],
		mock_variables,
	) with input as mock_input

	count(summary.message) == 1
	startswith(summary.message[0], "POLICY ERROR:")
	contains(summary.message[0], "both")
	summary.details == []
}

test_match_error_message_names_the_valid_values if {
	summary := helpers.get_multi_summary(
		[[object.union(meta, {"match": "both"}), valid_condition]],
		mock_variables,
	) with input as mock_input

	every m in helpers.valid_match_values {
		contains(summary.message[0], m)
	}
}

# A broken policy_type is the more fundamental error and is reported first, so
# fixing the match would not just reveal the type problem afterwards.
test_a_bad_policy_type_is_still_reported_before_a_bad_match if {
	summary := helpers.get_multi_summary(
		[[object.union(meta, {"match": "both"}), {"attribute_path": ["x"], "policy_type": "nonsense"}]],
		mock_variables,
	) with input as mock_input

	contains(summary.message[0], "nonsense")
}
