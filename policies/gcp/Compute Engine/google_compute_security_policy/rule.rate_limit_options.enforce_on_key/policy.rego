package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_rate_limit_options_enforce_on_key
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "The rate limit is enforced against all traffic collectively rather than per client, so no individual caller is ever isolated and a single abusive client consumes the shared allowance for everyone.",
    "remedies":[ "Set enforce_on_key to a per-client key such as IP so each caller is limited separately."]},
    {
        "condition": "enforce_on_key must not aggregate all traffic under a single key.",
        "attribute_path" : ["rule", 0, "rate_limit_options", 0, "enforce_on_key"],
        "values" : ["ALL"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details