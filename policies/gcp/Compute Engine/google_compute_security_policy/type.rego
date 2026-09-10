package terraform.gcp.security.compute_engine.google_compute_security_policy.type
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "The security policy is created at a tier that cannot use rate limiting, preconfigured WAF rule sets or Adaptive Protection, so those defences are unavailable regardless of how the policy is otherwise configured.",
    "remedies":[ "Set type to CLOUD_ARMOR so the full set of backend security capabilities can be enforced."]},
    {
        "condition": "type must be CLOUD_ARMOR to make the full protection feature set available.",
        "attribute_path" : ["type"],
        "values" : ["CLOUD_ARMOR"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details