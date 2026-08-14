package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_redirect_https_redirect

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's redirect action does not enforce HTTPS. Without https_redirect enabled, matched requests can be redirected over plain HTTP, exposing traffic to interception or downgrade attacks.",
            "remedies": [
                "Set rules.action.redirect.https_redirect to true so redirected requests are always upgraded to HTTPS."
            ]
        },
        {
            "condition": "Check that https_redirect is enabled",
            "attribute_path": ["rules", 0, "action", 0, "redirect", 0, "https_redirect"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details