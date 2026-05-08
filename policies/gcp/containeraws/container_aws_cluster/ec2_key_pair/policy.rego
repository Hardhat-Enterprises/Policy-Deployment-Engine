package terraform.gcp.security.containeraws.container_aws_cluster.ec2_key_pair
import data.terraform.helpers
import data.terraform.gcp.security.containeraws.container_aws_cluster.vars

conditions := [[
	{
		"situation_description": "Control plane SSH access is configured with an unapproved EC2 key pair.",
		"remedies": ["Use an approved managed EC2 key pair for SSH access."],
	},
	{
		"condition": "ssh_config ec2_key_pair must use an approved key pair",
		"attribute_path": ["control_plane", 0, "ssh_config", 0, "ec2_key_pair"],
		"values": ["approved-ec2-key-pair"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details