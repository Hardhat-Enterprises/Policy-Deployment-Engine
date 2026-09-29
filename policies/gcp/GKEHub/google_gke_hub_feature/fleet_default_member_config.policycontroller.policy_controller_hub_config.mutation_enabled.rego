package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_policycontroller_policy_controller_hub_config_mutation_enabled

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Policy Controller automatic resource mutation is enabled",
		"remedies": ["Set mutation_enabled to false"],
	},
	{
		"condition": "Automatic resource mutation must be disabled",
		"attribute_path": ["fleet_default_member_config", 0, "policycontroller", 0, "policy_controller_hub_config", 0, "mutation_enabled"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details