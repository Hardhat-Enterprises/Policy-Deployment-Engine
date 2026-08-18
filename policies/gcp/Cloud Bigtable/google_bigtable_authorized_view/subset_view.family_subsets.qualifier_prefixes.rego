package terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.subset_view_family_subsets_qualifier_prefixes
import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_authorized_view.vars
conditions := [
	[
		{
			"situation_description": "Authorized views must not grant full qualifier access by using an empty string in family_subsets.qualifier_prefixes, which can expose all column qualifiers in a family.",
			"remedies": [
				"Use non-empty qualifier_prefixes values (for example `user_`, `a/`) to scope which column qualifiers the view may read.",
				"Use the `qualifiers` list for exact base64-encoded qualifiers if prefix scoping is not appropriate.",
			],
		},
		{
			"condition":      "family_subsets.qualifier_prefixes must not include an empty string (full qualifier prefix access)",
			"attribute_path": ["subset_view", 0, "family_subsets", 0, "qualifier_prefixes"],
			"values":         [""],
			"policy_type":    "blacklist",
		},
	],
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
