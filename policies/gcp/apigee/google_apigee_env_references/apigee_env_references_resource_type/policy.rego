package terraform.gcp.security.apigee.google_apigee_env_references.apigee_env_references_resource_type

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_env_references.vars

conditions := [
    [
        {
            "situation_description": "resource_type must be set to KeyStore or TrustStore to ensure Apigee environment references are linked to a valid TLS/SSL certificate store, preventing misconfigured or unauthorized certificate usage",
            "remedies": [
                "Ensure resource_type is set to KeyStore for storing private keys and server certificates used in TLS/SSL",
                "Ensure resource_type is set to TrustStore for storing trusted CA certificates used to verify connections"
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