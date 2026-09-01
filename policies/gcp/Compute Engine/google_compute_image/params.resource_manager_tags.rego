package terraform.gcp.security.compute_engine.google_compute_image.params_resource_manager_tags

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

tag_key_pattern := `^tagKeys/[0-9]+$`
tag_value_pattern := `^tagValues/[0-9]+$`

invalid_resource_manager_tag(tags) if {
	some key, _ in tags
	not regex.match(tag_key_pattern, key)
}

invalid_resource_manager_tag(tags) if {
	some _, value in tags
	not regex.match(tag_value_pattern, value)
}

valid_resource_manager_tags(tags) if {
	is_object(tags)
	count(tags) > 0
	not invalid_resource_manager_tag(tags)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must use numeric Resource Manager tag references in the form tagKeys/{id} = tagValues/{id}.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	tags := object.get(resource.values, ["params", 0, "resource_manager_tags"], {})
	not valid_resource_manager_tags(tags)
	resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

resource_count := count([
resource |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
])

situation_results := [
	{
		"situation": "The Compute Image contains missing or structurally invalid Resource Manager tag references.",
		"remedies": [
			"Use numeric Resource Manager references in the form tagKeys/{tag-key-id} = tagValues/{tag-value-id}.",
		],
		"non_compliant_resources": violations,
		"conditions": [
			{
				"Resource Manager tags must use numeric tagKeys and tagValues references": violations,
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
