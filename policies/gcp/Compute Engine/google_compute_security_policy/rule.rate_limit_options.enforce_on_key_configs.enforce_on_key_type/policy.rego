package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_rate_limit_options_enforce_on_key_configs_enforce_on_key_type
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A rate limit key within a multi-key configuration aggregates all traffic under a single key, so no individual client is isolated and the limit protects nobody in particular.",
    "remedies":[ "Set enforce_on_key_type to a per-client key such as IP within each enforce_on_key_configs block."]},
    {
        "condition": "enforce_on_key_type must not aggregate all traffic under a single key.",
        "attribute_path" : ["rule", 0, "rate_limit_options", 0, "enforce_on_key_configs", 0, "enforce_on_key_type"],
        "values" : ["ALL"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details