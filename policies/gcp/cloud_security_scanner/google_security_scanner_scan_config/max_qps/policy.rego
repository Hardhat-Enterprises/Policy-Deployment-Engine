package terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.max_qps

import data.terraform.helpers
import data.terraform.gcp.security.cloud_security_scanner.google_security_scanner_scan_config.vars

conditions := [[
	{
		"situation_description": "Security scanner scan config has max_qps higher than the approved security limit.",
		"remedies": ["Set max_qps to 15 or lower."],
	},
	{
		"condition": "max_qps must not be greater than 15",
		"attribute_path": ["max_qps"],
		"values": [null, 15],
		"policy_type": "range",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details