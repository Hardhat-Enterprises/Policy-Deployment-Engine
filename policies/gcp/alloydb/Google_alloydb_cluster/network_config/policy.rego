package terraform.gcp.security.alloydb.google_alloydb_cluster.network_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [
	[
		{
			"situation_description": "AlloyDB cluster must specify a VPC network.",
			"remedies": ["Set the top-level `network` field to the required VPC self_link (projects/<p>/global/networks/<vpc>)."],
		},
		{
			"condition": "VPC network must be provided.",
			"attribute_path": ["network"],
			"values": [null, ""],
			"policy_type": "blacklist",
		},
	],
	[
		{
			"situation_description": "Cluster VPC network must be approved.",
			"remedies": ["Use one of the approved networks."],
		},
		{
			"condition": "VPC network must be on the allowlist.",
			"attribute_path": ["network"],
			"values": [
				"projects/pde-demo/global/networks/prod-vpc",
				"projects/shared-host-project/global/networks/shared-vpc",
			],
			"policy_type": "whitelist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
