package terraform.gcp.security.containeraws.container_aws_node_pool.iam_instance_profile
import data.terraform.gcp.security.containeraws.container_aws_node_pool.vars
import data.terraform.helpers

conditions := [[
	{
		"situation_description": "Node pool is using an unapproved IAM instance profile.",
		"remedies": ["Use an approved IAM instance profile for node pools."],
	},
	{
		"condition": "iam_instance_profile must not use unapproved profiles",
		"attribute_path": ["config", 0, "iam_instance_profile"],
		"values": ["unapproved-profile"],
		"policy_type": "blacklist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details