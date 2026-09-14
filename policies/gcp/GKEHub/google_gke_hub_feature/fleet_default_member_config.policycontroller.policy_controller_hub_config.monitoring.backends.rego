package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_default_member_config_policycontroller_policy_controller_hub_config_monitoring_backends

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Policy Controller telemetry is not exported to Cloud Monitoring",
		"remedies": ["Set monitoring backends to CLOUD_MONITORING"],
	},
	{
		"condition": "Policy Controller must export telemetry to Cloud Monitoring",
		"attribute_path": ["fleet_default_member_config", 0, "policycontroller", 0, "policy_controller_hub_config", 0, "monitoring", 0, "backends"],
		"values": ["CLOUD_MONITORING"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details