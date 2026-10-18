package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_action
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A rule that matches a specific source range is set to allow the traffic, so the rule performs no enforcement and the matched requests reach the backend.",
    "remedies":[ "Set rule.action to a denying action such as deny(403) on rules intended to block traffic."]},
    {
        "condition": "rule.action must not be allow on rules matching restricted source ranges.",
        "attribute_path" : ["rule", 0, "action"],
        "values" : ["allow"],
        "policy_type" : "blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details