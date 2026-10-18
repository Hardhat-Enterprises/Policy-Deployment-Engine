package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_mesh_management

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "GKE Hub Service Mesh lifecycle management is not automatic",
		"remedies": ["Set mesh management to MANAGEMENT_AUTOMATIC"],
	},
	{
		"condition": "Service Mesh management must be automatic",
		"attribute_path": ["fleet_default_member_config", 0, "mesh", 0, "management"],
		"values": ["MANAGEMENT_AUTOMATIC"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details