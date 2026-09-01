package terraform.gcp.security.identity_platform.google_identity_platform_config.sms_region_config_allowlist_only_allowed_regions

import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars as vars
import data.terraform.helpers as helpers

conditions := [
	[
		{
			"situation_description": "Verification SMS can be sent only to explicitly approved regional codes.",
			"remedies": ["Set allowed_regions to approved regional codes: AU or NZ."],
		},
		{
			"condition": "Each allowed SMS region must be on the approved regional-code allowlist.",
			"attribute_path": ["sms_region_config", 0, "allowlist_only", 0, "allowed_regions"],
			"values": ["AU", "NZ"],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
