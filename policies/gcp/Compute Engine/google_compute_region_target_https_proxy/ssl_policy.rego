package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.ssl_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars
conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy does not reference an SSL policy, which may allow weak TLS versions or cipher suites.",
            "remedies": ["Set ssl_policy to an approved SSL policy that enforces TLS 1.2+ and strong cipher suites."]
        },
        {
            "condition": "ssl_policy must be set.",
            "attribute_path": ["ssl_policy"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Region target HTTPS proxy references an SSL policy that does not match the required GCP SSL policy resource path format.",
            "remedies": ["Set ssl_policy to an approved SSL policy resource path in the format projects/PROJECT/regions/REGION/sslPolicies/POLICY_NAME."]
        },
        {
            "condition": "ssl_policy must match a valid GCP SSL policy resource path format.",
            "attribute_path": ["ssl_policy"],
            "values": ["^projects/.+/regions/.+/sslPolicies/.+"],
            "policy_type": "pattern whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details