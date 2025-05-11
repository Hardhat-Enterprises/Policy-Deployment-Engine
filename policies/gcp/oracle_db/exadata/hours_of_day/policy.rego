package terraform.gcp.security.oracle_db.exadata.hours_of_day # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Restrict maintenance to overnight hours",
    "remedies":["Set hours_of_day to time slots like 0 or 4"]},
    {
        "condition": "maintenance only allowed during safe hours",
        "attribute_path" : ["properties",0,"maintenance_window",0,"hours_of_day",0], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [0, 4], # Values to compare against
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