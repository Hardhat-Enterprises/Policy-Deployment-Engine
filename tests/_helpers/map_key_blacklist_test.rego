package terraform.helpers.policies.map_key_blacklist_test

import data.terraform.helpers.policies.map_key_blacklist
import rego.v1

# These values describe the Terraform resource used by the mock plans below.
mock_variables := {
	"resource_type": "google_dialogflow_cx_webhook",
	"friendly_resource_name": "Dialogflow CX Webhook",
	"resource_value_name": "display_name",
}

blacklisted_header_names := [
	"api-key",
	"authorization",
	"proxy-authorization",
	"x-api-key",
	"x-auth-token",
]

# Small builders keep each test focused on the behaviour being checked.
make_plan(resources) := {
	"planned_values": {
		"root_module": {
			"resources": resources,
		},
	},
}

make_generic_resource(display_name, headers) := {
	"type": "google_dialogflow_cx_webhook",
	"name": display_name,
	"values": {
		"display_name": display_name,
		"generic_web_service": [{
			"request_headers": headers,
		}],
	},
}

make_service_directory_resource(display_name, headers) := {
	"type": "google_dialogflow_cx_webhook",
	"name": display_name,
	"values": {
		"display_name": display_name,
		"service_directory": [{
			"generic_web_service": [{
				"request_headers": headers,
			}],
		}],
	},
}

# 1. A populated Authorization header is non-compliant.
test_authorization_header_is_rejected if {
	resource := make_generic_resource(
		"unsafe-webhook",
		{"Authorization": "Bearer inline-secret"},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 1
	some result in results
	result.name == "unsafe-webhook"
}

# 2. Capitalisation does not change the result.
test_header_names_are_case_insensitive if {
	resource := make_generic_resource(
		"mixed-case-webhook",
		{"X-aPi-KeY": "inline-secret"},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 1
}

# 3. A normal functional header is allowed.
test_safe_header_is_allowed if {
	resource := make_generic_resource(
		"safe-webhook",
		{"X-Request-Source": "dialogflow"},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 0
}

# 4. A sensitive key with an empty value is ignored.
test_empty_sensitive_header_is_allowed if {
	resource := make_generic_resource(
		"empty-header-webhook",
		{"Authorization": ""},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 0
}

# 5. A sensitive key with a null value is also ignored.
test_null_sensitive_header_is_allowed if {
	resource := make_generic_resource(
		"null-header-webhook",
		{"Authorization": null},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 0
}

# 6. A resource without the requested map is not reported.
test_missing_header_map_is_allowed if {
	resource := {
		"type": "google_dialogflow_cx_webhook",
		"name": "missing-map-webhook",
		"values": {
			"display_name": "missing-map-webhook",
		},
	}
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 0
}

# 7. The longer Service Directory attribute path works too.
test_service_directory_path_is_checked if {
	resource := make_service_directory_resource(
		"service-directory-webhook",
		{"authorization": "Bearer inline-secret"},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		[
			"service_directory",
			0,
			"generic_web_service",
			0,
			"request_headers",
		],
		blacklisted_header_names,
	) with input as input_plan

	count(results) == 1
}

# 8. The message names the header but never prints its secret value.
test_message_does_not_expose_header_value if {
	resource := make_generic_resource(
		"message-webhook",
		{"AUTHORIZATION": "Bearer do-not-print-this"},
	)
	input_plan := make_plan([resource])

	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"],
		blacklisted_header_names,
	) with input as input_plan

	some result in results
	contains(result.message, "AUTHORIZATION")
	not contains(result.message, "do-not-print-this")
}

# 9. Whitespace is still a populated value; do not silently trim credentials.
test_whitespace_value_is_rejected if {
	resource := make_generic_resource("whitespace", {"Authorization": " "})
	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"], blacklisted_header_names,
	) with input as make_plan([resource])
	count(results) == 1
}

# 10. This helper checks keys, not whether the attribute has the correct shape.
test_empty_or_non_map_input_is_ignored if {
	every headers in [{}, [], "Authorization", null] {
		resource := make_generic_resource("wrong-shape", headers)
		results := map_key_blacklist.get_violations(
			mock_variables,
			["generic_web_service", 0, "request_headers"], blacklisted_header_names,
		) with input as make_plan([resource])
		count(results) == 0
	}
}

# 11. A safe name containing part of a prohibited name is not a match.
test_key_matching_is_exact_not_a_substring if {
	resource := make_generic_resource("safe", {"X-Authorization-Mode": "basic"})
	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"], blacklisted_header_names,
	) with input as make_plan([resource])
	count(results) == 0
}

# 12. Report a resource once, with matching key names in a stable order.
test_multiple_keys_produce_one_violation_per_resource if {
	resource := make_generic_resource("multiple", {"Authorization": "one", "X-API-Key": "two"})
	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"], ["AUTHORIZATION", "x-api-key"],
	) with input as make_plan([resource])
	count(results) == 1
	some result in results
	contains(result.message, "Authorization, X-API-Key")
}

# 13. Only the resource type selected by the policy is checked.
test_other_resource_types_are_ignored if {
	resource := object.union(
		make_generic_resource("other", {"Authorization": "secret"}),
		{"type": "google_unrelated_resource"},
	)
	results := map_key_blacklist.get_violations(
		mock_variables,
		["generic_web_service", 0, "request_headers"], blacklisted_header_names,
	) with input as make_plan([resource])
	count(results) == 0
}
