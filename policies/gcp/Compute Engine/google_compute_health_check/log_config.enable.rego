package terraform.gcp.security.compute_engine.google_compute_health_check.log_config_enable
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_health_check.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Health check logging is disabled",
    "remedies":[ "Set log_config.enable to true to enable health check logging."]},
    {
        "condition": "Check whether health check logging is enabled",
        "attribute_path" : ["log_config", 0, "enable"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
    

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details