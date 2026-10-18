package terraform.gcp.security.gke_hub.google_gke_hub_feature.spec_fleetobservability_logging_config_fleet_scope_logs_config_mode

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Fleet-scope logs routing is not COPY or MOVE",
		"remedies": ["Set fleet-scope logs mode to COPY or MOVE"],
	},
	{
		"condition": "Fleet-scope logs routing mode must be COPY or MOVE",
		"attribute_path": ["spec", 0, "fleetobservability", 0, "logging_config", 0, "fleet_scope_logs_config", 0, "mode"],
		"values": ["COPY", "MOVE"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details