package terraform.gcp.security.containeraws.container_aws_cluster.group
import data.terraform.helpers
import data.terraform.gcp.security.containeraws.container_aws_cluster.vars

conditions := [[
	{
		"situation_description": "Cluster admin access is assigned to an unapproved admin group.",
		"remedies": ["Use an approved Deakin admin group such as group@deakin.edu.au."],
	},
	{
		"condition": "admin_groups group must use an approved organisation-managed email address",
		"attribute_path": ["authorization", 0, "admin_groups", 0, "group"],
		"values": ["group@deakin.edu.au"],
		"policy_type": "pattern whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details