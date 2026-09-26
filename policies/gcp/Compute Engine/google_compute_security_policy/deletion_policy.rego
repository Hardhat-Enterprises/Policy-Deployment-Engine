package terraform.gcp.security.compute_engine.google_compute_security_policy.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "Terraform is permitted to destroy this Cloud Armor security policy, which would remove the WAF, IP filtering and rate limiting protecting the attached backend services.",
    "remedies":[ "Set deletion_policy to PREVENT so the policy cannot be removed as a side effect of a routine apply."]},
    {
        "condition": "deletion_policy must be PREVENT to protect the security policy from deletion.",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details