package terraform.gcp.security.gke_hub.google_gke_hub_feature.location

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "GKE Hub Feature is deployed outside the approved global location",
		"remedies": ["Set location to global"],
	},
	{
		"condition": "GKE Hub Feature location must be global",
		"attribute_path": ["location"],
		"values": ["global"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details