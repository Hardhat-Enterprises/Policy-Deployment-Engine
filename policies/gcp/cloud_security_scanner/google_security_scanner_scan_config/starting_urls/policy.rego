package terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.starting_urls

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.vars

conditions := [[
	{
		"situation_description": "Security scanner scan config is using insecure HTTP starting URLs.",
		"remedies": ["Use HTTPS URLs in starting_urls."],
	},
	{
		"condition": "starting_urls must not use insecure HTTP",
		"attribute_path": ["starting_urls", 0],
		"values": ["http://example.com"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details