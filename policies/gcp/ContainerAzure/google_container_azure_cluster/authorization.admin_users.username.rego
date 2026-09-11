package terraform.gcp.security.Container_Azure.google_container_azure_cluster.authorization_admin_users_username

import data.terraform.helpers
import data.terraform.gcp.security.Container_Azure.google_container_azure_cluster.vars

conditions := [[
	{
		"situation_description": "The authorization.admin_users.username attribute must not use an explicitly prohibited administrator username.",
		"remedies": ["Remove the prohibited administrator username from the authorization.admin_users.username attribute."],
	},
	{
		"condition": "Check if the admin_users username is not a prohibited username.",
		"attribute_path": ["authorization", 0, "admin_users", 0, "username"],
		"values": ["UNAUTHORIZED_ADMIN_USER"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details