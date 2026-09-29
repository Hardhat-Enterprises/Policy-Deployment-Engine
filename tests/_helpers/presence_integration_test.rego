package terraform.helpers.presence_integration_test

import data.terraform.helpers
import rego.v1

# Runs presence conditions through the full dispatcher and summary, including
# the "match": "all" pattern for "when this block exists, X must hold".

route_variables := {
	"resource_type": "google_network_services_http_route",
	"friendly_resource_name": "Network Services HTTP Route",
	"resource_value_name": "name",
}

route_plan(action) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_network_services_http_route",
	"name": "example-route",
	"values": {"name": "example-route", "rules": [{"action": [action]}]},
}]}}}

# Flag a route only when it has a redirect block AND https_redirect is not true.
https_redirect_conditions := [[
	{
		"situation_description": "A redirect action does not force HTTPS, so redirected requests can be downgraded to plain HTTP",
		"remedies": ["Set rules.action.redirect.https_redirect to true on redirect actions."],
		"match": "all",
	},
	{
		"condition": "The rule configures a redirect",
		"attribute_path": ["rules", 0, "action", 0, "redirect"],
		"values": ["unset"],
		"policy_type": "presence",
	},
	{
		"condition": "The redirect forces HTTPS",
		"attribute_path": ["rules", 0, "action", 0, "redirect", 0, "https_redirect"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

passed(result) if contains(json.marshal(result.message), "None - All passed")

# 1. A route with no redirect passes (the false positive the first review found).
test_route_without_redirect_passes if {
	result := helpers.get_multi_summary(https_redirect_conditions, route_variables) with input as route_plan({"destinations": [{"service_name": "svc"}], "redirect": []})
	passed(result)
}

# 2. A redirect with https_redirect = true passes.
test_https_redirect_true_passes if {
	result := helpers.get_multi_summary(https_redirect_conditions, route_variables) with input as route_plan({"redirect": [{"https_redirect": true, "host_redirect": "example.com"}]})
	passed(result)
}

# 3. A redirect with https_redirect = false is reported.
test_https_redirect_false_is_reported if {
	result := helpers.get_multi_summary(https_redirect_conditions, route_variables) with input as route_plan({"redirect": [{"https_redirect": false, "host_redirect": "example.com"}]})
	not passed(result)
	contains(json.marshal(result), "example-route")
}

# 4. A redirect that omits https_redirect is reported (the gap the second review found).
test_https_redirect_omitted_is_reported if {
	result := helpers.get_multi_summary(https_redirect_conditions, route_variables) with input as route_plan({"redirect": [{"host_redirect": "example.com"}]})
	not passed(result)
}

template_variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

template_plan(nic) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_compute_instance_template",
	"name": "example-template",
	"values": {"name": "example-template", "network_interface": [nic]},
}]}}}

access_config_conditions(mode) := [[
	{
		"situation_description": "The instance template gives its network interface an external IP address",
		"remedies": ["Remove network_interface.access_config so instances have no external IP."],
	},
	{
		"condition": "network_interface.access_config is not configured",
		"attribute_path": ["network_interface", 0, "access_config"],
		"values": [mode],
		"policy_type": "presence",
	},
]]

# 5. An external IP block is reported directly.
test_access_config_is_reported if {
	result := helpers.get_multi_summary(access_config_conditions("unset"), template_variables) with input as template_plan({"network": "default", "access_config": [{"nat_ip": ""}]})
	not passed(result)
}

# 6. No external IP block passes.
test_no_access_config_passes if {
	result := helpers.get_multi_summary(access_config_conditions("unset"), template_variables) with input as template_plan({"network": "default", "access_config": []})
	passed(result)
}

# 7. The type name is case-insensitive.
test_mixed_case_type_name_is_supported if {
	conditions := [[access_config_conditions("unset")[0][0], object.union(access_config_conditions("unset")[0][1], {"policy_type": "Presence"})]]
	result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan({"access_config": [{"nat_ip": ""}]})
	out := json.marshal(result)
	not passed(result)
	not contains(out, "POLICY ERROR")
}

# 8. Invalid modes are a POLICY ERROR, not a silent pass.
test_invalid_modes_report_policy_error if {
	every values in [[], ["present"], ["set", "unset"], [true], null] {
		conditions := [[access_config_conditions("unset")[0][0], object.union(access_config_conditions("unset")[0][1], {"values": values})]]
		result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan({})
		contains(json.marshal(result.message), "POLICY ERROR")
	}
}

# 9. Missing values is a POLICY ERROR.
test_missing_values_report_policy_error if {
	conditions := [[access_config_conditions("unset")[0][0], object.remove(access_config_conditions("unset")[0][1], ["values"])]]
	result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan({})
	contains(json.marshal(result.message), "POLICY ERROR")
}
