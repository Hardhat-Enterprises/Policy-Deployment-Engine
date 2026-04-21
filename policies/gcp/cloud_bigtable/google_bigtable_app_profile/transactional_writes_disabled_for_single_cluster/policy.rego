package terraform.gcp.security.cloud_bigtable.google_bigtable_app_profile.transactional_writes_disabled_for_single_cluster

import data.terraform.helpers
import data.terraform.gcp.security.cloud_bigtable.google_bigtable_app_profile.vars

conditions := [
	[
		{
			"situation_description": "App profiles with single_cluster_routing must not enable allow_transactional_writes, which can have performance and consistency tradeoffs and is disallowed by this control.",
			"remedies": [
				"Set `allow_transactional_writes = false` inside the `single_cluster_routing` block on `google_bigtable_app_profile`.",
				"If transactional semantics are required, redesign routing or workloads per platform guidance rather than enabling this flag here.",
			],
		},
		{
			"condition":      "single_cluster_routing.allow_transactional_writes must not be true",
			"attribute_path": ["single_cluster_routing", 0, "allow_transactional_writes"],
			"values":         [true],
			"policy_type":    "blacklist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
