package terraform.gcp.security.apigee.google_apigee_target_server.s_sl_info_ciphers

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_target_server.vars

conditions := [
    [
        {
            "situation_description": "The Apigee target server uses a cipher suite that does not provide approved protection for communications with the backend service.",
            "remedies": [
                "Configure the target server to use an approved strong cipher suite.",
                "Remove legacy cipher suites such as 3DES, RC4, DES, and NULL ciphers."
            ]
        },
        {
            "condition": "Check whether s_sl_info.ciphers contains only approved cipher suites.",
            "attribute_path": ["s_sl_info", 0, "ciphers"],
            "values": [
                "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
                "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
                "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
                "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"
            ],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays detailed compliance results for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
