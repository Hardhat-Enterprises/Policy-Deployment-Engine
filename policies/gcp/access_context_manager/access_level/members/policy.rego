package terraform.gcp.security.access_context_manager.access_level.members # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.access_level.vars

# Defining the condition for members
conditions := [
    [
        {
            "situation_description" : "Specific members are not included",
            "remedies": [
                "Add required members to the policy."
            ]
        },
        {
            "condition": "Ensure specific members are included in the policy",
            "attribute_path" : ["members"], # Path to the members attribute
            "values" : ["domain:deakin.edu.au"], # List of required members
            "policy_type" : "whitelist" # Enforcing a whitelist check for members
        }
    ]
]

# General policy compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details