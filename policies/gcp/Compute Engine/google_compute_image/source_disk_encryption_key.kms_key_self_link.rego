package terraform.gcp.security.compute_engine.google_compute_image.source_disk_encryption_key_kms_key_self_link

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The source disk encryption key does not use a structurally valid Cloud KMS reference.",
			"remedies": [
				"Set source_disk_encryption_key.kms_key_self_link to a complete Cloud KMS resource path.",
			],
		},
		{
			"condition": "A source disk KMS key self-link must be configured.",
			"attribute_path": ["source_disk_encryption_key", 0, "kms_key_self_link"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
]

kms_key_pattern := `^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$`

valid_kms_key_self_link(value) if {
	is_string(value)
	regex.match(kms_key_pattern, value)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must set source_disk_encryption_key.kms_key_self_link to a valid Cloud KMS path.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	value := object.get(resource.values, ["source_disk_encryption_key", 0, "kms_key_self_link"], null)
	not valid_kms_key_self_link(value)
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
		"situation": "The source disk encryption key does not use a structurally valid Cloud KMS key reference.",
		"remedies": [
			"Set source_disk_encryption_key.kms_key_self_link using projects/{project}/locations/{location}/keyRings/{key-ring}/cryptoKeys/{key}.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Source disk KMS key self-link must use the required resource path": violations,
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
