package terraform.gcp.security.compute_engine.google_compute_region_network_endpoint_group.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_endpoint_group.vars

conditions := [
	[
		{
			"situation_description": "The endpoint group can be deleted by Terraform, so a destroy or a replacing apply removes it outright.",
			"remedies": ["Set deletion_policy to PREVENT so the endpoint group cannot be deleted through Terraform."]
		},
		{
			"condition": "deletion_policy is not set to PREVENT",
			"attribute_path": ["deletion_policy"],
			"values": ["PREVENT"],
			"policy_type": "whitelist"
		}
	]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
