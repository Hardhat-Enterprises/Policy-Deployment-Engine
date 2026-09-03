package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_preview

import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Security policy rules should not be left in preview mode.",
		"remedies": ["Set preview to false so the security rule is enforced."],
	},
	{
		"condition": "Security policy rule preview must be disabled",
		"attribute_path": ["rules", 0, "preview"],
		"values": [false],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
