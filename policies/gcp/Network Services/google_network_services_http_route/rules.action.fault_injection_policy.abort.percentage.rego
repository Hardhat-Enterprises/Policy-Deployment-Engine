package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_fault_injection_policy_abort_percentage

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's fault injection policy aborts an excessive percentage of matched traffic. A high abort percentage can function as a self-inflicted denial of service if left active outside a controlled testing window.",
            "remedies": [
                "Keep rules.action.fault_injection_policy.abort.percentage at or below 50 for any route serving production traffic.",
                "Scope high abort percentages to short-lived, clearly labeled chaos-testing configurations only."
            ]
        },
        {
            "condition": "Check that abort.percentage stays within a safe range",
            "attribute_path": ["rules", 0, "action", 0, "fault_injection_policy", 0, "abort", 0, "percentage"],
            "values": [0, 50],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details