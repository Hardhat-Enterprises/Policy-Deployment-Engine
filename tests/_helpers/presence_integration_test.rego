package terraform.helpers.presence_integration_test

import data.terraform.helpers
import rego.v1

# Runs presence conditions through the full dispatcher and summary. Also pins
# how a per-rule HTTPS redirect check is written: the path follows every rule,
# so a rule without a redirect produces nothing to check and no "match": "all"
# pairing across rules is needed.

passed(result) if contains(json.marshal(result.message), "None - All passed")

template_variables := {
	"resource_type": "google_compute_instance_template",
	"friendly_resource_name": "Compute Instance Template",
	"resource_value_name": "name",
}

template_plan(nics) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_compute_instance_template",
	"name": "example-template",
	"values": {"name": "example-template", "network_interface": nics},
}]}}}

access_config_conditions(mode) := [[
	{
		"situation_description": "The instance template gives a network interface an external IP address",
		"remedies": ["Remove network_interface.access_config so instances have no external IP."],
	},
	{
		"condition": "No network interface configures access_config",
		"attribute_path": ["network_interface", "access_config"],
		"values": [mode],
		"policy_type": "presence",
	},
]]

# 1. An external IP on the second interface only is reported.
test_second_interface_access_config_is_reported if {
	result := helpers.get_multi_summary(access_config_conditions("unset"), template_variables) with input as template_plan([
		{"network": "default", "access_config": []},
		{"network": "default", "access_config": [{"nat_ip": ""}]},
	])
	not passed(result)
	contains(json.marshal(result), "network_interface.[1].access_config")
}

# 2. No interface with an external IP passes.
test_no_access_config_passes if {
	result := helpers.get_multi_summary(access_config_conditions("unset"), template_variables) with input as template_plan([
		{"network": "default", "access_config": []},
		{"network": "default", "access_config": []},
	])
	passed(result)
}

# 3. The type name is case-insensitive.
test_mixed_case_type_name_is_supported if {
	conditions := [[access_config_conditions("unset")[0][0], object.union(access_config_conditions("unset")[0][1], {"policy_type": "Presence"})]]
	result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan([{"access_config": [{"nat_ip": ""}]}])
	not passed(result)
	not contains(json.marshal(result), "POLICY ERROR")
}

# 4. Invalid modes are a POLICY ERROR, not a silent pass.
test_invalid_modes_report_policy_error if {
	every values in [[], ["present"], ["set", "unset"], [true], null] {
		conditions := [[access_config_conditions("unset")[0][0], object.union(access_config_conditions("unset")[0][1], {"values": values})]]
		result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan([])
		contains(json.marshal(result.message), "POLICY ERROR")
	}
}

# 5. Missing values is a POLICY ERROR.
test_missing_values_report_policy_error if {
	conditions := [[access_config_conditions("unset")[0][0], object.remove(access_config_conditions("unset")[0][1], ["values"])]]
	result := helpers.get_multi_summary(conditions, template_variables) with input as template_plan([])
	contains(json.marshal(result.message), "POLICY ERROR")
}

route_variables := {
	"resource_type": "google_network_services_http_route",
	"friendly_resource_name": "Network Services HTTP Route",
	"resource_value_name": "name",
}

route_plan(rules) := {"planned_values": {"root_module": {"resources": [{
	"type": "google_network_services_http_route",
	"name": "example-route",
	"values": {"name": "example-route", "rules": rules},
}]}}}

secure_redirect_rule := {"action": [{"redirect": [{"https_redirect": true, "host_redirect": "example.com"}]}]}

insecure_redirect_rule := {"action": [{"redirect": [{"https_redirect": false, "host_redirect": "example.com"}]}]}

omitted_redirect_rule := {"action": [{"redirect": [{"host_redirect": "example.com"}]}]}

no_redirect_rule := {"action": [{"destinations": [{"service_name": "svc"}], "redirect": []}]}

# Every configured redirect, in every action of every rule, must force HTTPS.
# The path yields one https_redirect per configured redirect, so rules without a
# redirect contribute nothing. element required treats the single value as a
# one-item list, so [true] means "must be true"; false and omitted both fail.
per_rule_https_conditions := [[
	{
		"situation_description": "A redirect action does not force HTTPS, so redirected requests can be downgraded to plain HTTP",
		"remedies": ["Set rules.action.redirect.https_redirect to true on every redirect action."],
	},
	{
		"condition": "Every configured redirect sets https_redirect to true",
		"attribute_path": ["rules", "action", "redirect", "https_redirect"],
		"values": [true],
		"policy_type": "element required",
	},
]]

# 6. A route whose rules have no redirect passes.
test_route_without_redirects_passes if {
	result := helpers.get_multi_summary(per_rule_https_conditions, route_variables) with input as route_plan([no_redirect_rule, no_redirect_rule])
	passed(result)
}

# 7. Rule 1 has a secure redirect and rule 2 has no redirect: passes. Pairing a
# "redirect is configured" condition with an "https_redirect is true" condition
# under "match": "all" would combine rule 1's redirect with rule 2's missing
# value, because match combines per resource, not per rule.
test_secure_redirect_and_rule_without_redirect_passes if {
	result := helpers.get_multi_summary(per_rule_https_conditions, route_variables) with input as route_plan([secure_redirect_rule, no_redirect_rule])
	passed(result)
}

# 8. An insecure redirect in the second rule is reported by its own path.
test_insecure_redirect_in_second_rule_is_reported if {
	result := helpers.get_multi_summary(per_rule_https_conditions, route_variables) with input as route_plan([secure_redirect_rule, insecure_redirect_rule])
	out := json.marshal(result)
	not passed(result)
	contains(out, "rules.[1].action.[0].redirect.[0].https_redirect")
	not contains(out, "rules.[0].action")
}

# 9. A redirect that omits https_redirect is reported.
test_omitted_https_redirect_is_reported if {
	result := helpers.get_multi_summary(per_rule_https_conditions, route_variables) with input as route_plan([no_redirect_rule, omitted_redirect_rule])
	out := json.marshal(result)
	not passed(result)
	contains(out, "rules.[1].action.[0].redirect.[0].https_redirect")
}
