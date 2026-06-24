package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.cmek_required
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars
conditions := [
	[
		{
			"situation_description": "Cloud Bigtable clusters must use customer-managed encryption keys (CMEK); clusters without kms_key_name rely on default encryption only.",
			"remedies": [
				"Add `kms_key_name` under the `cluster` block pointing to a Cloud KMS crypto key your project may use.",
				"Grant the Bigtable service account access to the key and prefer a key in the same region as the cluster.",
			],
		},
		{
			"condition":        "cluster.kms_key_name must be set for CMEK",
			"attribute_path": ["cluster", 0, "kms_key_name"],
			"values":           [null, ""],
			"policy_type":      "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
