package terraform.gcp.security.deploy.delivery_pipeline.serial_pipeline # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {"situation_description": "Delivery Pipeline missing serial pipeline configuration",
         "remedies": ["Delivery Pipeline must have serial pipeline stages defined for controlled deployment"]},
        {
            "condition": "Delivery Pipeline has serial pipeline configured",
            "attribute_path": ["serial_pipeline"],
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