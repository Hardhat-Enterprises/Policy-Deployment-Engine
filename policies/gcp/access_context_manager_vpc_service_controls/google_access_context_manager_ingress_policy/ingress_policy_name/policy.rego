package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_ingress_policy.ingress_policy_name

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_ingress_policy.ingress_policy_name.vars

conditions := [
    [
        {
            "situation_description": "Ensure the ingress policy is attached to the correct authorized service perimeter.",
            "remedies": ["Update ingress_policy_name to 'accessPolicies/123456/servicePerimeters/my_perimeter'."]
        },
        {
            "condition": "ingress_policy_name is authorized",
            "attribute_path": ["ingress_policy_name"],
            "values": ["accessPolicies/123456/servicePerimeters/my_perimeter"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details