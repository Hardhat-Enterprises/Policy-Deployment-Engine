package terraform.gcp.security.compute_engine.google_compute_image.project

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The Compute Image uses a project outside the approved platform namespace.",
			"remedies": [
				"Set project to an approved project ID following the platform-* naming convention.",
			],
		},
		{
			"condition": "A project must be explicitly configured.",
			"attribute_path": ["project"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
]

approved_project_pattern := `^platform-[a-z][a-z0-9-]{3,18}[a-z0-9]$`

valid_project(value) if {
	is_string(value)
	regex.match(approved_project_pattern, value)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must use a project ID that follows the approved platform-* naming convention.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	value := object.get(resource.values, "project", null)
	not valid_project(value)
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
		"situation": "The Compute Image is being created in a project outside the approved platform project namespace.",
		"remedies": [
			"Set project to an approved project ID beginning with platform- and following the organisation-wide naming convention.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Project ID must follow the approved platform naming convention": violations,
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
