package terraform.gcp.security.apigee.google_apigee_env_references.apigee_env_references_resource_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_env_references.vars

conditions := [
    [
        {
            "situation_description": "resource_type must be KeyStore or TrustStore to ensure proper TLS/SSL certificate management",
            "remedies": [
                "Ensure resource_type is set to KeyStore for storing private keys and certificates",
                "Ensure resource_type is set to TrustStore for storing trusted certificates"
            ]
        },
        {
            "condition": "check resource_type is KeyStore or TrustStore",
            "attribute_path": ["resource_type"],
            "values": ["KeyStore", "TrustStore"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details