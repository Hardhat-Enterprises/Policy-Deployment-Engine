package terraform.gcp.security.gke_hub.google_gke_hub_fleet.default_cluster_config_security_posture_config_mode

import data.terraform.gcp.security.gke_hub.google_gke_hub_fleet.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Security Posture management is disabled for the GKE Hub Fleet.",
			"remedies": [
				"Set security posture mode to BASIC or ENTERPRISE.",
			],
		},
		{
			"condition": "Security Posture management must be enabled.",
			"attribute_path": ["default_cluster_config", 0, "security_posture_config", 0, "mode"],
			"values": ["BASIC", "ENTERPRISE"],
			"policy_type": "whitelist",
		},
	],
]

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"GKE Hub Fleet '%s' must enable Security Posture management using BASIC or ENTERPRISE mode.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	mode := object.get(
		resource.values,
		["default_cluster_config", 0, "security_posture_config", 0, "mode"],
		null,
	)
	not mode in {"BASIC", "ENTERPRISE"}
	resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

non_compliant_resource_names := {
	violation.name |
	some violation in violations
}

resource_count := count([
	resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
])

situation_results := [
	{
		"situation": "Security Posture management is disabled for the GKE Hub Fleet.",
		"remedies": [
			"Set security posture mode to BASIC or ENTERPRISE.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Security Posture mode must be BASIC or ENTERPRISE": violations,
			},
		],
	},
]

message := helpers.format_summary_messages(
	vars.variables.friendly_resource_name,
	resource_count,
	situation_results,
)

details := situation_results