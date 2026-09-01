package terraform.gcp.security.compute_engine.google_compute_image.storage_locations

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

approved_storage_locations := {
	"australia-southeast1",
	"australia-southeast2",
}

invalid_storage_location(locations) if {
	some location in locations
	not approved_storage_locations[location]
}

valid_storage_locations(locations) if {
	is_array(locations)
	count(locations) > 0
	not invalid_storage_location(locations)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must store image data only in approved Australian regions.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	locations := object.get(resource.values, "storage_locations", [])
	not valid_storage_locations(locations)
	resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

resource_count := count([
resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
])

situation_results := [
	{
		"situation": "The Compute Image uses a missing or unapproved storage location that does not satisfy the platform data-residency rule.",
		"remedies": [
			"Set storage_locations to australia-southeast1 or australia-southeast2.",
		],
		"non_compliant_resources": violations,
		"conditions": [
			{
				"Storage locations must contain only approved Australian regions": violations,
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
