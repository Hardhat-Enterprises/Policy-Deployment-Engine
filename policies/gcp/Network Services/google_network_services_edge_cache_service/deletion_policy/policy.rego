package terraform.gcp.security.network_services.google_network_services_edge_cache_service.deletion_policy

import data.terraform.gcp.security.network_services.google_network_services_edge_cache_service.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The edge cache service is using ABANDON as its deletion policy. This can remove the service from Terraform while leaving it running in Google Cloud.",
			"remedies": [
				"Set deletion_policy to DELETE or PREVENT so the service stays under Terraform management.",
			],
		},
		{
			"condition": "deletion_policy must not be set to ABANDON.",
			"attribute_path": ["deletion_policy"],
			"values": ["ABANDON"],
			"policy_type": "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
