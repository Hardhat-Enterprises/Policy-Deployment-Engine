package terraform.gcp.security.alloydb.google_alloydb_instance.client_connection_config

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [[
	{
		"situation_description": "Instance must require SSL/TLS for client connections.",
		"remedies": ["Set client_connection_config.ssl_config.ssl_mode to ENCRYPTED_ONLY."],
	},
	{
		"condition": "SSL mode must be ENCRYPTED_ONLY.",
		"attribute_path": ["client_connection_config", "ssl_config", "ssl_mode"],
		"values": ["ENCRYPTED_ONLY"],
		"policy_type": "whitelist",
	},
]]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
