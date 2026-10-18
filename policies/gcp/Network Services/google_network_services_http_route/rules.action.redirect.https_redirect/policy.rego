package terraform.gcp.security.network_services.google_network_services_http_route.rules_action_redirect_https_redirect

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_http_route.vars

conditions := [
    [
        {
            "situation_description": "The HTTP route's redirect action explicitly sets https_redirect to false, so redirected requests can be sent over plain HTTP. This allows redirected traffic to be downgraded and exposed to interception.",
            "remedies": [
                "Set rules.action.redirect.https_redirect to true on redirect actions so redirected requests use HTTPS.",
                "Routes that do not configure a redirect action are not affected by this check."
            ]
        },
        {
            "condition": "Check that https_redirect is not explicitly false",
            "attribute_path": ["rules", 0, "action", 0, "redirect", 0, "https_redirect"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details