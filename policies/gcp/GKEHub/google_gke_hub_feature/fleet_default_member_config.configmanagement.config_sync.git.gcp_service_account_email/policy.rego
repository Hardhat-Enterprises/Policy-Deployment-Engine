package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_configmanagement_config_sync_git_gcp_service_account_email

import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Config Sync Git authentication does not use a structurally valid Google service account.",
			"remedies": [
				"Set Git gcp_service_account_email to a valid Google IAM service-account email.",
			],
		},
		{
			"condition": "Git authentication must use a valid Google service account.",
			"attribute_path": ["fleet_default_member_config", 0, "configmanagement", 0, "config_sync", 0, "git", 0, "gcp_service_account_email"],
			"values": ["*@*", [["*"], ["*.iam.gserviceaccount.com"]]],
			"policy_type": "pattern whitelist",
		},
	],
]

service_account_pattern := `^[a-z0-9-]+@[a-z0-9-]+\.iam\.gserviceaccount\.com$`

valid_service_account(value) if {
	is_string(value)
	regex.match(service_account_pattern, value)
}

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"GKE Hub Feature '%s' must use a valid Google IAM service account for Config Sync Git authentication.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	value := object.get(
		resource.values,
		["fleet_default_member_config", 0, "configmanagement", 0, "config_sync", 0, "git", 0, "gcp_service_account_email"],
		null,
	)
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
		"situation": "Config Sync Git authentication does not use a structurally valid Google service account.",
		"remedies": [
			"Use the format service-account@project-id.iam.gserviceaccount.com.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"Git service account must use the Google IAM email structure": violations,
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