package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.server_tls_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars
conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference a server TLS policy, which may leave inbound connections without mutual TLS authentication.",
            "remedies": ["Set server_tls_policy to an approved policy that enforces encryption and mutual TLS authentication."]
        },
        {
            "condition": "server_tls_policy must be set.",
            "attribute_path": ["server_tls_policy"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details