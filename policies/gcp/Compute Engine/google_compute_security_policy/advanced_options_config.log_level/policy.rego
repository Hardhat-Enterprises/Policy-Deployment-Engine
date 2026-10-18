package terraform.gcp.security.compute_engine.google_compute_security_policy.advanced_options_config_log_level
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "Logging is set to the normal level, so Cloud Armor does not record which rule matched a request or why, leaving no detail to investigate an incident or tune rules against false positives.",
    "remedies":[ "Set advanced_options_config.log_level to VERBOSE so rule evaluation is recorded in full."]},
    {
        "condition": "log_level must be VERBOSE so enforcement decisions are auditable.",
        "attribute_path" : ["advanced_options_config", 0, "log_level"],
        "values" : ["VERBOSE"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details