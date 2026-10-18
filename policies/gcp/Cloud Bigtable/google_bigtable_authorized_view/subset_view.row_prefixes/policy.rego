package terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.subset_view_row_prefixes
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.vars
conditions := [
	[
		{
			"situation_description": "Authorized views must not grant full-table row access via an empty row prefix in subset_view.row_prefixes, which exposes all rows in the backing table.",
			"remedies": [
				"Replace empty-string row prefixes with explicit non-empty prefixes that scope rows (for example `user_`, `tenant-a/`).",
				"If broader access is needed, split data across tables or use tighter family/qualifier subsets rather than an empty prefix.",
			],
		},
		{
			"condition":      "subset_view.row_prefixes must not include an empty string (full row access)",
			"attribute_path": ["subset_view", 0, "row_prefixes"],
			"values":         [""],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
