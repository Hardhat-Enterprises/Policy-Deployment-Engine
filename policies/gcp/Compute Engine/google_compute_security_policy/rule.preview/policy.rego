package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preview
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A rule is left in preview mode, so its action is recorded in logs but never enforced and matching requests continue through to the backend while the rule appears fully configured.",
    "remedies":[ "Set rule.preview to false on any rule that is relied upon for enforcement."]},
    {
        "condition": "rule.preview must be false so the rule's action is actually enforced.",
        "attribute_path" : ["rule", 0, "preview"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details