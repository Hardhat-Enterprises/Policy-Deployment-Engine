package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.ssl_certificates
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars
conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference any SSL certificates, which may leave connections without TLS authentication.",
            "remedies": ["Set ssl_certificates to reference at least one valid SSL certificate resource."]
        },
        {
            "condition": "ssl_certificates must be set.",
            "attribute_path": ["ssl_certificates"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details