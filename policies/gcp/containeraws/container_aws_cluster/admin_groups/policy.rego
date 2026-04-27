package terraform.gcp.security.containeraws.container_aws_cluster.admin_groups
import data.terraform.gcp.security.containeraws.container_aws_cluster.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Cluster admin access is assigned to an unapproved admin group.",
		"remedies": ["Use a Deakin admin group ending in @deakin.edu.au."],
	},
	{
		"condition": "admin_groups group must not use an unapproved group email",
		"attribute_path": ["authorization", 0, "admin_groups", 0, "group"],
		"values": ["group@domain.com"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
