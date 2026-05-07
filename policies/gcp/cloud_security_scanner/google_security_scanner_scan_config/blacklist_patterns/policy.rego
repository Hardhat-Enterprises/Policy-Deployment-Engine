package terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.blacklist_patterns

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.vars

conditions := [[
	{
		"situation_description": "Security scanner scan config does not exclude sensitive URL patterns.",
		"remedies": ["Add blacklist_patterns for sensitive paths such as admin, logout, delete, payment, or account pages."],
	},
	{
		"condition": "blacklist_patterns must not be null or empty",
		"attribute_path": ["blacklist_patterns"],
		"values": [null, []],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details