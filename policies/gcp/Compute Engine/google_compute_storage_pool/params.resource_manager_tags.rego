package terraform.gcp.security.compute_engine.google_compute_storage_pool.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_storage_pool.vars

conditions := [
	[
		{
			"situation_description": "Storage Pool contains incorrectly formatted Resource Manager tags when tags are provided.",
			"remedies": [
				"Resource Manager tags are optional. When configured, use a supported numeric or namespaced GCP tag key and value format."
			]
		},
		{
			"condition": "Resource Manager tags are optional. When provided, their format is validated by this policy.",
			"attribute_path": [
				"params",
				0,
				"resource_manager_tags"
			],
			"values": [],
			"policy_type": "blacklist"
		}
	]
]

# Numeric Resource Manager tag format:
# tagKeys/{tag-key-id} = tagValues/{tag-value-id}
numeric_tag_key_pattern := `^tagKeys/[0-9]+$`
numeric_tag_value_pattern := `^tagValues/[0-9]+$`

# Namespaced Resource Manager tag format:
# {organisation-id|project-id}/{tag-key-short-name} = {tag-value-short-name}
namespaced_tag_key_pattern := `^(?:[0-9]+|[a-z][a-z0-9-]{4,28}[a-z0-9])/[A-Za-z0-9](?:[A-Za-z0-9._-]{0,254}[A-Za-z0-9])?$`
namespaced_tag_value_pattern := `^[A-Za-z0-9](?:[A-Za-z0-9._-]{0,254}[A-Za-z0-9])?$`

# A tag entry is valid when it uses either a complete numeric pair
# or a complete namespaced pair. Mixed formats are invalid.
valid_resource_manager_tag(key, value) if {
	regex.match(numeric_tag_key_pattern, key)
	regex.match(numeric_tag_value_pattern, value)
}

valid_resource_manager_tag(key, value) if {
	regex.match(namespaced_tag_key_pattern, key)
	regex.match(namespaced_tag_value_pattern, value)
}

invalid_resource_manager_tag(tags) if {
	some key, value in tags
	not valid_resource_manager_tag(key, value)
}

# The argument is optional: null, omitted, and empty maps are compliant.
valid_resource_manager_tags(tags) if {
	tags == null
}

valid_resource_manager_tags(tags) if {
	is_object(tags)
	not invalid_resource_manager_tag(tags)
}

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"Storage Pool '%s' has invalid Resource Manager tag references. When configured, use either tagKeys/{id} = tagValues/{id} or {organisation-id|project-id}/{tag-key-short-name} = {tag-value-short-name}.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type

	tags := object.get(
		resource.values,
		["params", 0, "resource_manager_tags"],
		{},
	)

	not valid_resource_manager_tags(tags)

	resource_name := object.get(
		resource.values,
		vars.variables.resource_value_name,
		resource.name,
	)
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
		"situation": "The Storage Pool contains incorrectly formatted Resource Manager tag references.",
		"remedies": [
			"Resource Manager tags are optional. When configured, use either tagKeys/{tag-key-id} = tagValues/{tag-value-id} or {organisation-id|project-id}/{tag-key-short-name} = {tag-value-short-name}.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Resource Manager tags, when configured, must use a supported GCP numeric or namespaced format": violations,
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