package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.server_tls_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference an approved server TLS policy, which may leave inbound connections unencrypted or without mutual TLS authentication.",
            "remedies": ["Set server_tls_policy to an approved policy that enforces encryption and mutual TLS authentication."]
        },
        {
            "condition": "server_tls_policy must reference an approved TLS policy.",
            "attribute_path": ["server_tls_policy"],
            "values": ["projects/my-project/locations/australia-southeast1/serverTlsPolicies/mtls-policy"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details