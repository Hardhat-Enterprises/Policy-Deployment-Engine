package terraform.gcp.security.deploy.target.anthos_cluster # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {
            "situation_description": "Anthos cluster membership doesn't follow security naming conventions",
            "remedies": ["Use approved cluster membership naming that includes security classification"]
        },
        {
            "condition": "Anthos cluster membership must follow secure naming convention",
            "attribute_path": ["anthos_cluster", 0, "membership"],
            "values": [
                "projects/my-project/locations/us-central1/memberships/prod-secure-hybrid-cluster"
            ],
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