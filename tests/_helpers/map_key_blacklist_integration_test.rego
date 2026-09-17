package terraform.helpers.map_key_blacklist_integration_test

import data.terraform.helpers

variables := {
	"resource_type": "google_dialogflow_cx_webhook",
	"friendly_resource_name": "Dialogflow CX Webhook",
	"resource_value_name": "display_name",
}

# The same conditions layout is used by ordinary PDE resource policies.
header_conditions(path) := [[
	{
		"situation_description": "The webhook contains sensitive inline headers",
		"remedies": ["Use secret_versions_for_request_headers for credentials."],
	},
	{
		"condition": "Reject populated sensitive header names regardless of capitalisation",
		"attribute_path": path,
		"values": ["Authorization", "X-API-Key"],
		"policy_type": "map key blacklist",
	},
]]

plan_for(values) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_dialogflow_cx_webhook",
	"name": "example",
	"values": object.union({"display_name": "example"}, values),
}]}}}

test_generic_conditions_report_violation_without_secret if {
	plan := plan_for({"generic_web_service": [{"request_headers": {
		"aUtHoRiZaTiOn": "do-not-expose-this-secret",
		"Content-Type": "application/json",
	}}]})
	result := helpers.get_multi_summary(header_conditions(["generic_web_service", 0, "request_headers"]), variables) with input as plan
	result.details[0].non_compliant_resources == {"example"}
	count(result.message) == 2
	not contains(json.marshal(result), "do-not-expose-this-secret")
}

test_service_directory_conditions_report_violation if {
	plan := plan_for({"service_directory": [{"generic_web_service": [{
		"request_headers": {"x-api-key": "example-secret"},
	}]}]})
	result := helpers.get_multi_summary(
		header_conditions([
			"service_directory", 0, "generic_web_service", 0, "request_headers",
		]),
		variables,
	) with input as plan
	result.details[0].non_compliant_resources == {"example"}
}

test_conditions_allow_safe_and_empty_headers if {
	plan := plan_for({"generic_web_service": [{"request_headers": {
		"Authorization": "", "X-API-Key": null, "Content-Type": "application/json",
	}}]})
	result := helpers.get_multi_summary(header_conditions(["generic_web_service", 0, "request_headers"]), variables) with input as plan
	result.details[0].non_compliant_resources == set()
	contains(json.marshal(result.message), "None - All passed")
}
