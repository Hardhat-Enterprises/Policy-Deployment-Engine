package terraform.gcp.security.gke_hub.google_gke_hub_feature.spec_rbacrolebindingactuation_allowed_custom_roles

import data.terraform.gcp.security.gke_hub.google_gke_hub_feature.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Fleet RBAC role bindings contain a custom role that does not follow the approved-role naming convention.",
                "remedies": [
                        "Use only organisation-approved custom ClusterRoles whose names begin with approved-.",
                ],
        },
        {
                "condition": "Custom ClusterRole names must follow the approved-role naming convention.",
                "attribute_path": ["spec", 0, "rbacrolebindingactuation", 0, "allowed_custom_roles"],
                "values": ["approved-*"],
                "policy_type": "pattern whitelist",
        },
]]

approved_role_pattern := `^approved-[a-z0-9]([-a-z0-9]*[a-z0-9])?$`

valid_approved_role(role) if {
        is_string(role)
        regex.match(approved_role_pattern, role)
}

role_list_is_approved(roles) if {
        is_array(roles)
        count(roles) > 0
        every role in roles {
                valid_approved_role(role)
        }
}

violations := [
        {
                "name": resource_name,
                "message": sprintf(
                        "GKE Hub Feature '%s' must allow only approved custom ClusterRoles.",
                        [resource_name],
                ),
        } |
        resource := input.planned_values.root_module.resources[_]
        resource.type == vars.variables.resource_type
        roles := object.get(
                resource.values,
                ["spec", 0, "rbacrolebindingactuation", 0, "allowed_custom_roles"],
                [],
        )
        not role_list_is_approved(roles)
        resource_name := object.get(resource.values, vars.variables.resource_value_name, resource.name)
]

non_compliant_resource_names := {
        violation.name |
        some violation in violations
}

resource_count := count([
        resource |
        resource := input.planned_values.root_module.resources[_]
        resource.type == vars.variables.resource_type
])

situation_results := [{
        "situation": "Fleet RBAC role bindings contain a custom role that does not follow the approved-role naming convention.",
        "remedies": [
                "Use only organisation-approved custom ClusterRoles whose names begin with approved-.",
        ],
        "non_compliant_resources": non_compliant_resource_names,
        "conditions": [{
                "Custom ClusterRole names must follow the approved-role naming convention": violations,
        }],
}]

message := helpers.format_summary_messages(
        vars.variables.friendly_resource_name,
        resource_count,
        situation_results,
)

details := situation_results