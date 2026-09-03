package terraform.gcp.security.compute_engine.google_compute_image.source_image_encryption_key_kms_key_service_account

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The source image encryption configuration does not use a structurally valid service account.",
			"remedies": [
				"Set source_image_encryption_key.kms_key_service_account to a valid IAM service-account email.",
			],
		},
		{
			"condition": "A source image KMS service account must be configured.",
			"attribute_path": ["source_image_encryption_key", 0, "kms_key_service_account"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
]

service_account_pattern := `^[a-z][a-z0-9-]{4,28}[a-z0-9]@[a-z][a-z0-9-]{4,28}[a-z0-9]\.iam\.gserviceaccount\.com$`

valid_service_account(value) if {
	is_string(value)
	regex.match(service_account_pattern, value)
}

violations := [
{
	"name": resource_name,
	"message": sprintf(
		"Compute Image '%s' must set source_image_encryption_key.kms_key_service_account to a valid service-account email.",
		[resource_name],
	),
} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	value := object.get(resource.values, ["source_image_encryption_key", 0, "kms_key_service_account"], null)
	not valid_service_account(value)
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
		"situation": "The source image encryption configuration does not specify a structurally valid KMS service account.",
		"remedies": [
			"Set source_image_encryption_key.kms_key_service_account using service-account@project-id.iam.gserviceaccount.com.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Source image KMS service account must use the required IAM email structure": violations,
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
