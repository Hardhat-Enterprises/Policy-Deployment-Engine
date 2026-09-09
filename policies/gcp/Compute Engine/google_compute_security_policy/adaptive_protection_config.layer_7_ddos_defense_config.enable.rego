package terraform.gcp.security.compute_engine.google_compute_security_policy.adaptive_protection_config_layer_7_ddos_defense_config_enable
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_security_policy.vars

conditions := [
    [
    {"situation_description" : "Adaptive Protection is disabled, so the policy has no Layer 7 DDoS detection and volumetric application-layer attacks that static rules cannot match will go unnoticed.",
    "remedies":[ "Set adaptive_protection_config.layer_7_ddos_defense_config.enable to true so Layer 7 DDoS detection is active."]},
    {
        "condition": "Layer 7 DDoS defense must be enabled on the security policy.",
        "attribute_path" : ["adaptive_protection_config", 0, "layer_7_ddos_defense_config", 0, "enable"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details