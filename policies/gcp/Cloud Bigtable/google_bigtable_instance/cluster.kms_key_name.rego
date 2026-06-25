package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.cluster_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars

# Merged policy for `cluster.kms_key_name` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[
		{
			"situation_description": "Bigtable cluster CMEK keys must use an approved KMS resource path equivalent to `projects/*/locations/australia-southeast1/keyRings/*/cryptoKeys/*`: project, region, key ring, and key segments must each match approved values (region locked to australia-southeast1).",
			"remedies": [
				"Point `cluster.kms_key_name` at a KMS key under `locations/australia-southeast1` with path shape `projects/<project>/locations/australia-southeast1/keyRings/<ring>/cryptoKeys/<key>`.",
				"Provision or select a crypto key in `australia-southeast1`, grant Bigtable access, and reference that full resource name.",
			],
		},
		{
			"condition": "KMS key path segments must match approved australia-southeast1 layout",
			"attribute_path": ["cluster", 0, "kms_key_name"],
			"values": [
				"projects/*/locations/*/keyRings/*/cryptoKeys/*",
				[
					["PDE"],
					["australia-southeast1"],
					["bt-kr"],
					["bt-cmek"],
				],
			],
			"policy_type": "pattern whitelist",
		},
	],
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
