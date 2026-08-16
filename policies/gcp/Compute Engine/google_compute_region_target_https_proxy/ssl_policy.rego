package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.ssl_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference an approved SSL policy, which may allow weak TLS versions or cipher suites.",
            "remedies": ["Set ssl_policy to an approved SSL policy that enforces TLS 1.2+ and strong cipher suites."]
        },
        {
            "condition": "ssl_policy must reference an approved SSL policy.",
            "attribute_path": ["ssl_policy"],
            "values": ["projects/my-project/regions/australia-southeast1/sslPolicies/restricted-ssl-policy"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details