package terraform.gcp.security.alloydb.google_alloydb_instance.client_connection_config_ssl_config_ssl_mode

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [[
	{
		"situation_description": "Instance must require SSL/TLS for client connections.",
		"remedies": ["Set client_connection_config.ssl_config.ssl_mode to ENCRYPTED_ONLY."],
	},
	{
		"condition": "SSL mode must be ENCRYPTED_ONLY.",
		"attribute_path": ["client_connection_config", 0, "ssl_config", 0, "ssl_mode"],
		"values": ["ENCRYPTED_ONLY"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
