package terraform.gcp.security.gke_hub.google_gke_hub_feature.fleet_logging_default_mode_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Fleet Observability default logs routing is not COPY or MOVE",
		"remedies": ["Set mode to COPY or MOVE"],
	},
	{
		"condition": "Default logs routing mode must be COPY or MOVE",
		"attribute_path": ["spec", 0, "fleetobservability", 0, "logging_config", 0, "default_config", 0, "mode"],
		"values": ["COPY", "MOVE"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
