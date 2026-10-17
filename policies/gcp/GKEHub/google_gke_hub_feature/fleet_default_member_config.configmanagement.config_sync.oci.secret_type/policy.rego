package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_configmanagement_config_sync_oci_secret_type

import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "Config Sync OCI uses an unapproved authentication mechanism.",
			"remedies": [
				"Set OCI secret_type to gcpserviceaccount.",
			],
		},
		{
			"condition": "OCI authentication must use the approved Google service-account mechanism.",
			"attribute_path": ["fleet_default_member_config", 0, "configmanagement", 0, "config_sync", 0, "oci", 0, "secret_type"],
			"values": ["gcpserviceaccount"],
			"policy_type": "whitelist",
		},
	],
]

violations := [
	{
		"name": resource_name,
		"message": sprintf(
			"GKE Hub Feature '%s' must set Config Sync OCI secret_type to gcpserviceaccount.",
			[resource_name],
		),
	} |
	resource := input.planned_values.root_module.resources[_]
	resource.type == vars.variables.resource_type
	secret_type := object.get(
		resource.values,
		["fleet_default_member_config", 0, "configmanagement", 0, "config_sync", 0, "oci", 0, "secret_type"],
		null,
	)
	secret_type != "gcpserviceaccount"
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
		"situation": "Config Sync OCI uses an unapproved authentication mechanism.",
		"remedies": [
			"Set OCI secret_type to gcpserviceaccount and configure an approved Google service account.",
		],
		"non_compliant_resources": non_compliant_resource_names,
		"conditions": [
			{
				"OCI secret type must be gcpserviceaccount": violations,
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