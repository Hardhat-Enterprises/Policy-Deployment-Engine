package terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.export_to_security_command_center

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.vars

conditions := [[
	{
		"situation_description": "Security scanner findings are not being exported to Security Command Center.",
		"remedies": ["Set export_to_security_command_center to ENABLED."],
	},
	{
		"condition": "export_to_security_command_center must be ENABLED",
		"attribute_path": ["export_to_security_command_center"],
		"values": ["ENABLED"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details