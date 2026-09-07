package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.access_levels_basic_conditions_members

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars
import data.terraform.helpers

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
conditions := [[
	{
		"situation_description": "An allowed list of members.",
		"remedies": ["Update members to include authorized users only."],
	},
	{
		"condition": "members must be authorized",
		"attribute_path": ["access_levels", 0, "basic", 0, "conditions", 0, "members"],
		"values": ["user:admin@example.com"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
