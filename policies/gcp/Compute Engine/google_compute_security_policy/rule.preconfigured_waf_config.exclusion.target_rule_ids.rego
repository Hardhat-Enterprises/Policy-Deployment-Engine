package terraform.gcp.security.compute_engine.google_compute_security_policy.rule_preconfigured_waf_config_exclusion_target_rule_ids
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "A WAF exclusion targets every rule in the rule set rather than named signatures, turning a narrow tuning exception into a blanket disabling of the whole rule set for the matched request field.",
    "remedies":[ "List the specific WAF rule identifiers the exclusion is intended to suppress instead of using a wildcard."]},
    {
        "condition": "target_rule_ids must name specific rule identifiers rather than matching all of them.",
        "attribute_path" : ["rule", 0, "preconfigured_waf_config", 0, "exclusion", 0, "target_rule_ids"],
        "values" : ["*"],
        "policy_type" : "element blacklist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details