package terraform.gcp.security.gke_hub.google_gke_hub_feature.spec_rbacrolebindingactuation_allowed_custom_roles

import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars

conditions := [[
        {
                "situation_description": "Fleet RBAC role bindings allow a built-in privileged Kubernetes role instead of a custom role",
                "remedies": ["Remove built-in privileged roles and allow only organisation-approved custom ClusterRoles"],
        },
        {
                "condition": "Only custom ClusterRoles may be included in allowed_custom_roles",
                "attribute_path": ["spec", 0, "rbacrolebindingactuation", 0, "allowed_custom_roles"],
                "values": ["cluster-admin", "admin", "edit", "view"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details