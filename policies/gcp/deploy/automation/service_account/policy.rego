package terraform.gcp.security.deploy.automation.service_account # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.automation.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {"situation_description": "Automation using generic service account",
         "remedies": ["Automation should use dedicated service account with specific naming pattern"]},
        {
            "condition": "Automation uses dedicated service account",
            "attribute_path": ["service_account"],
            "values": ["dedicated-automation-sa@my-project.iam.gserviceaccount.com"],
            "policy_type": "whitelist"
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