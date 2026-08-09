package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_retry_policy_num_retries

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's retry policy allows an excessive number of retries. An unbounded or very high retry count can amplify load against a struggling backend during an outage, creating a self-inflicted retry-storm/denial-of-service pattern.",
            "remedies": [
                "Set rules.action.retry_policy.num_retries to a safe upper bound (e.g. 5 or fewer).",
                "Combine with a per_try_timeout to prevent retries from compounding latency under load."
            ]
        },
        {
            "condition": "Check that num_retries stays within a safe range",
            "attribute_path": ["rules", 0, "action", 0, "retry_policy", 0, "num_retries"],
            "values": [0, 5],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details