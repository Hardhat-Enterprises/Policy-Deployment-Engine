package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.ssl_certificates

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not use an approved SSL certificate, which may compromise TLS authentication.",
            "remedies": ["Set ssl_certificates to reference an approved SSL certificate managed by the organisation."]
        },
        {
            "condition": "ssl_certificates must include an approved certificate.",
            "attribute_path": ["ssl_certificates"],
            "values": ["projects/my-project/regions/australia-southeast1/sslCertificates/approved-cert"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details