package terraform.gcp.security.cloud_bigtable.google_bigtable_table.change_stream_retention
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_table.vars
conditions := [
	[
		{
			"situation_description": "Disabling change stream retention (for example by setting it to 0) removes visibility into data change history, which weakens monitoring, operational recovery, and auditability of who or what changed your data.",
			"remedies": [
				"Set `change_stream_retention` to a non-zero duration between 1 and 7 days using values Terraform accepts (Go duration syntax), for example `change_stream_retention = 24h` (one day) through `change_stream_retention = 168h` (seven days) on `google_bigtable_table`.",
			],
		},
		{
			"condition":      "change_stream_retention must not be disabled (0)",
			"attribute_path": ["change_stream_retention"],
			"values":         ["0"],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
