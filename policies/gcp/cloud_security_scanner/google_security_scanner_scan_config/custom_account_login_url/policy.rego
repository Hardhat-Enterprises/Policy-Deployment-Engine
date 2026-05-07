package terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.custom_account_login_url

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.vars

conditions := [[
	{
		"situation_description": "Custom account authentication is using an insecure login URL.",
		"remedies": ["Use an HTTPS login_url inside authentication.custom_account."],
	},
	{
		"condition": "custom_account login_url must not use insecure HTTP",
		"attribute_path": ["authentication", 0, "custom_account", 0, "login_url"],
		"values": ["http://example.com/login"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details