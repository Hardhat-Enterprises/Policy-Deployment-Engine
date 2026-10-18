package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_policycontroller_policy_controller_hub_config_log_denies_enabled

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Policy Controller deny and dry-run failure logging is disabled",
		"remedies": ["Set log_denies_enabled to true"],
	},
	{
		"condition": "Policy Controller deny logging must be enabled",
		"attribute_path": ["fleet_default_member_config", 0, "policycontroller", 0, "policy_controller_hub_config", 0, "log_denies_enabled"],
		"values": [true],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details