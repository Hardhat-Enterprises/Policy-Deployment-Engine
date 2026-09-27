package terraform.gcp.security.compute_engine.google_compute_image.family

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The Compute Image uses an image family outside the approved platform naming namespace.",
			"remedies": [
				"Remove the family setting or use a family name beginning with approved-.",
			],
		},
		{
			"condition": "Family may be unset when a fixed image is required.",
			"attribute_path": ["family"],
			"values": [null, ""],
			"policy_type": "whitelist",
		},
	],
]

approved_family_pattern := `^approved-[a-z][a-z0-9-]{0,52}[a-z0-9]$`

valid_family(value) if {
	value == null
}

valid_family(value) if {
	value == ""
}

valid_family(value) if {
	is_string(value)
	regex.match(approved_family_pattern, value)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must leave family unset or use the approved-* platform naming convention.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	value := object.get(resource.values, "family", null)
	not valid_family(value)
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
		"situation": "The Compute Image uses an image family outside the approved platform naming namespace.",
		"remedies": [
			"Remove the family setting or use a family name beginning with approved-.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Image family must be unset or follow the approved platform namespace": violations,
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
