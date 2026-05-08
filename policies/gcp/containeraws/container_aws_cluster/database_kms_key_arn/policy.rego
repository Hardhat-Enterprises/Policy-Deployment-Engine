package terraform.gcp.security.containeraws.container_aws_cluster.database_kms_key_arn
import data.terraform.helpers
import data.terraform.gcp.security.containeraws.container_aws_cluster.vars

conditions := [[
	{
		"situation_description": "Cluster secrets are encrypted with an unapproved AWS KMS key.",
		"remedies": ["Use an approved AWS KMS key ARN for database encryption."],
	},
	{
		"condition": "database_encryption kms_key_arn must use an approved KMS key",
		"attribute_path": ["control_plane", 0, "database_encryption", 0, "kms_key_arn"],
		"values": ["arn:aws:kms:my-aws-region:012345678910:key/approved-key-id"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details