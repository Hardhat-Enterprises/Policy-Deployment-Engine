package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.certificate_manager_certificates
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars
conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference any Certificate Manager certificates, which may leave connections without properly managed TLS authentication.",
            "remedies": ["Set certificate_manager_certificates to reference at least one valid Certificate Manager certificate resource."]
        },
        {
            "condition": "certificate_manager_certificates must be set.",
            "attribute_path": ["certificate_manager_certificates"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details