package terraform.gcp.security.compute_engine.google_compute_security_policy.adaptive_protection_config_layer_7_ddos_defense_config_threshold_configs_auto_deploy_confidence_threshold
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "The confidence required before Adaptive Protection automatically deploys a mitigation is set so high that auto-deploy is unlikely to trigger, leaving an attack detected but unmitigated.",
    "remedies":[ "Set auto_deploy_confidence_threshold within a range that allows automated mitigation to engage during a genuine attack."]},
    {
        "condition": "auto_deploy_confidence_threshold must sit within a range that keeps auto-deployment effective.",
        "attribute_path" : ["adaptive_protection_config", 0, "layer_7_ddos_defense_config", 0, "threshold_configs", 0, "auto_deploy_confidence_threshold"],
        "values" : [0, 0.9],
        "policy_type" : "range"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details