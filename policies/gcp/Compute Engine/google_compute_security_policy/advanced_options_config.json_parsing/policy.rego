package terraform.gcp.security.compute_engine.google_compute_security_policy.advanced_options_config_json_parsing
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "JSON body parsing is disabled, so the preconfigured WAF rules cannot inspect the contents of JSON request bodies and injection payloads carried inside JSON fields reach the backend unexamined.",
    "remedies":[ "Set advanced_options_config.json_parsing to STANDARD so JSON request bodies are parsed and inspected by the WAF."]},
    {
        "condition": "json_parsing must be STANDARD so JSON request bodies are inspected.",
        "attribute_path" : ["advanced_options_config", 0, "json_parsing"],
        "values" : ["STANDARD"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details