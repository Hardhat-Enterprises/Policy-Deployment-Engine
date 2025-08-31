package terraform.gcp.security.deploy.delivery_pipeline.suspended # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Policy is suspended",
    "remedies":[ "Ensure policy is not suspended"]},
    {
        "condition": "Policy is suspended",
        "attribute_path" : ["suspended"],
        "values" : [false],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details