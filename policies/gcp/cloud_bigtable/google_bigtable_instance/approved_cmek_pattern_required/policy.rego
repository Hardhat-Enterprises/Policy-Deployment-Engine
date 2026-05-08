package terraform.gcp.security.cloud_bigtable.google_bigtable_instance.approved_cmek_pattern_required
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_instance.vars
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
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
