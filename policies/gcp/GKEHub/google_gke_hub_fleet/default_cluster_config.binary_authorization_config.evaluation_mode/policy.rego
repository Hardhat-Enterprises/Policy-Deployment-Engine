package terraform.gcp.security.gke_hub.google_gke_hub_fleet.default_cluster_config_binary_authorization_config_evaluation_mode

import data.terraform.gcp.security.gke_hub.google_gke_hub_fleet.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Binary Authorization policy evaluation is disabled for the GKE Hub Fleet.",
			"remedies": [
				"Set evaluation_mode to POLICY_BINDINGS.",
			],
		},
		{
			"condition": "Binary Authorization policy evaluation must be enabled.",
			"attribute_path": ["default_cluster_config", 0, "binary_authorization_config", 0, "evaluation_mode"],
			"values": ["POLICY_BINDINGS"],
			"policy_type": "whitelist",
		},
	],
]

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"GKE Hub Fleet '%s' must set Binary Authorization evaluation_mode to POLICY_BINDINGS.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	evaluation_mode := object.get(
		resource.values,
		["default_cluster_config", 0, "binary_authorization_config", 0, "evaluation_mode"],
		null,
	)
	evaluation_mode != "POLICY_BINDINGS"
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
		"situation": "Binary Authorization policy evaluation is disabled for the GKE Hub Fleet.",
		"remedies": [
			"Set evaluation_mode to POLICY_BINDINGS.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Binary Authorization evaluation mode must be POLICY_BINDINGS": violations,
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