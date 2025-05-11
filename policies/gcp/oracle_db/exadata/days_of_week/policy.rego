package terraform.gcp.security.oracle_db.exadata.days_of_week # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Restrict maintenance to weekdays only",
    "remedies":[ "Set days_of_week to MONDAY through FRIDAY"]},
    {
        "condition": "maintenance allowed only on weekdays",
        "attribute_path" : ["properties",0,"maintenance_window",0,"days_of_week",0], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details