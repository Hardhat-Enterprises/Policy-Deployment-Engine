package terraform.gcp.security.gke_hub.google_gke_hub_feature.spec_rbacrolebindingactuation_allowed_custom_roles

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
	{
		"situation_description": "Fleet RBAC role bindings contain an unapproved custom role",
		"remedies": ["Use only approved custom roles in allowed_custom_roles"],
	},
	{
		"condition": "Fleet RBAC custom roles must be approved",
		"attribute_path": ["spec", 0, "rbacrolebindingactuation", 0, "allowed_custom_roles"],
		"values": ["approved-fleet-role"],
		"policy_type": "whitelist",
	},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details