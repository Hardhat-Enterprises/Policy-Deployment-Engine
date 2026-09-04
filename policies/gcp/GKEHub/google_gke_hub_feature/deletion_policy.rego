package terraform.gcp.security.gke_hub.google_gke_hub_feature.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "GKE Hub Feature deletion protection is not enabled",
		"remedies": ["Set deletion_policy to PREVENT"],
	},
	{
		"condition": "Deletion policy must prevent resource destruction",
		"attribute_path": ["deletion_policy"],
		"values": ["PREVENT"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details