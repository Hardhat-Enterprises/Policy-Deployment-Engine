package terraform.gcp.security.identity_platform.google_identity_platform_config.sms_region_config_allow_by_default_disallowed_regions

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars as vars
import data.terraform.helpers as helpers

conditions := [
	[
		{
			"situation_description": "SMS regions blocked by an allow-by-default configuration must be approved regional codes.",
			"remedies": ["Set disallowed_regions to approved regional codes: AU or NZ."],
		},
		{
			"condition": "Each disallowed SMS region must be on the approved regional-code allowlist.",
			"attribute_path": ["sms_region_config", 0, "allow_by_default", 0, "disallowed_regions"],
			"values": ["AU", "NZ"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
