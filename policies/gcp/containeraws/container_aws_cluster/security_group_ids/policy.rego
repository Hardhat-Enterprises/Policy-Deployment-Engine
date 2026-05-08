package terraform.gcp.security.containeraws.container_aws_cluster.security_group_ids
import data.terraform.helpers
import data.terraform.gcp.security.containeraws.container_aws_cluster.vars

conditions := [[
	{
		"situation_description": "Control plane replicas are using unapproved AWS security groups.",
		"remedies": ["Use only approved security group IDs for control plane replicas."],
	},
	{
		"condition": "security_group_ids must use approved security groups",
		"attribute_path": ["control_plane", 0, "security_group_ids"],
		"values": ["sg-approved-control-plane"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details