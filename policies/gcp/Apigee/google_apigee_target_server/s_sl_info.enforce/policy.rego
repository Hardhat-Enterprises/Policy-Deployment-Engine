package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_enforce

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "Strict TLS certificate validation is not enforced for the Apigee target server, which could allow connections to a backend presenting an invalid or untrusted certificate.",
            "remedies": [
                "Set s_sl_info.enforce to true.",
                "Configure a truststore containing the trusted backend certificate chain.",
                "Ensure that backend certificates are valid, trusted, unexpired, and match the target hostname."
            ]
        },
        {
            "condition": "Check whether strict TLS certificate validation is enforced.",
            "attribute_path": [
                "s_sl_info",
                0,
                "enforce"
            ],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

# Evaluates the conditions once and stores the summary
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
