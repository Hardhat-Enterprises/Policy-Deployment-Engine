package terraform.gcp.security.Container_Azure.google_container_azure_cluster.authorization_admin_groups_group

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
	{
		"situation_description": "The authorization.admin_groups.group attribute must not use an explicitly prohibited administrator group.",
		"remedies": ["Remove the prohibited administrator group from the authorization.admin_groups.group attribute."],
	},
	{
		"condition": "Check if the admin_groups group is not a prohibited group.",
		"attribute_path": ["authorization", 0, "admin_groups", 0, "group"],
		"values": ["UNAUTHORIZED_ADMIN_GROUP"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details