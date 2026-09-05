package terraform.gcp.security.identity_platform.google_identity_platform_config.sms_region_config_allowlist_only_allowed_regions

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars
import data.terraform.helpers.shared

region_code_pattern := "^[A-Z]{2}$"
conditions := []

resources := [
resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
]

has_invalid_region_code(regions) if {
	some region in regions
	not regex.match(region_code_pattern, region)
}

non_compliant_resource(resource) if {
	sms_configs := object.get(resource.values, "sms_region_config", [])
	some sms_config in sms_configs
	allowlist_configs := object.get(sms_config, "allowlist_only", [])
	some allowlist_config in allowlist_configs
	regions := object.get(allowlist_config, "allowed_regions", [])
	is_array(regions)
	has_invalid_region_code(regions)
}

non_compliant_resources := [resource | resource := resources[_]; non_compliant_resource(resource)]

non_compliant_names := [
shared.get_resource_attribute(resource, vars.variables.resource_value_name) |
	resource := non_compliant_resources[_]
]

non_compliant_display := concat(", ", non_compliant_names) if count(non_compliant_names) > 0
non_compliant_display := "None - All passed" if count(non_compliant_names) == 0

message := [
	sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(resources)]),
	"Situation 1: An allowed SMS region is not a valid global two-letter region code.",
	sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
	"Potential Remedies: Use uppercase two-letter CLDR/ISO-style region codes; select the actual regions per workload.",
]

details := [{
	"situation": "An allowed SMS region is not a valid global two-letter region code.",
	"remedies": ["Use uppercase two-letter CLDR/ISO-style region codes; select the actual regions per workload."],
	"non_compliant_resources": non_compliant_names,
}]
