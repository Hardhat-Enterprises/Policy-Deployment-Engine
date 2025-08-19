package terraform.gcp.security.deploy.custom_target_type.custom_actions # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.custom_target_type.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {"situation_description": "Custom Target Type missing custom actions",
         "remedies": ["Custom Target Type must have custom actions defined for security"]},
        {
            "condition": "Custom Target Type has custom actions",
            "attribute_path": ["custom_actions"],
            "values": [[]],
            "policy_type": "blacklist"
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