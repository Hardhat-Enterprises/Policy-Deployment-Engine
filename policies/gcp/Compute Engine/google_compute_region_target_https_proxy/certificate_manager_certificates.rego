package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.certificate_manager_certificates

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not use an approved Certificate Manager certificate, which may compromise TLS trust.",
            "remedies": ["Set certificate_manager_certificates to reference an approved certificate managed through Certificate Manager."]
        },
        {
            "condition": "certificate_manager_certificates must include an approved certificate.",
            "attribute_path": ["certificate_manager_certificates"],
            "values": ["projects/my-project/locations/australia-southeast1/certificates/approved-cert"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details