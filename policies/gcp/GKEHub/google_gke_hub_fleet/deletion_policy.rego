package terraform.gcp.security.gke_hub.google_gke_hub_fleet.deletion_policy

import data.terraform.gcp.security.gke_hub.google_gke_hub_fleet.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The GKE Hub Fleet can be accidentally or unauthorizedly destroyed.",
			"remedies": [
				"Set deletion_policy to PREVENT.",
			],
		},
		{
			"condition": "Fleet deletion must be prevented.",
			"attribute_path": ["deletion_policy"],
			"values": ["PREVENT"],
			"policy_type": "whitelist",
		},
	],
]

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"GKE Hub Fleet '%s' must set deletion_policy to PREVENT.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	deletion_policy := object.get(resource.values, "deletion_policy", null)
	deletion_policy != "PREVENT"
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
		"situation": "The GKE Hub Fleet is not protected from deletion.",
		"remedies": [
			"Set deletion_policy to PREVENT.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Fleet deletion policy must be PREVENT": violations,
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