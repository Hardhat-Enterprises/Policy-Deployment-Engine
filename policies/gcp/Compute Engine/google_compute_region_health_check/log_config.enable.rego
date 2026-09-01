package terraform.gcp.security.compute.google_compute_region_health_check.log_config_enable
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_region_health_check.vars

conditions := [
    [
    {"situation_description" : "Health check logging is disabled, leaving no audit trail of probe activity",
    "remedies":[ "Set log_config.enable = true so health check results are exported for monitoring and incident investigation"]},
    {
        "condition": "Health check log export is not enabled",
        "attribute_path" : ["log_config", "enable"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
