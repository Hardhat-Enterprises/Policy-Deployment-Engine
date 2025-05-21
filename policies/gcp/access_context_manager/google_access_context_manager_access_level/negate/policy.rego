package terraform.gcp.security.access_context_manager.google_access_context_manager_access_level.negate # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.google_access_context_manager_access_level.vars

# Defining the condition for the negate flag
conditions := [
    [
        {
            "situation_description" : "Negate is set to true when it shouldn't be",
            "remedies": [
                "Set negate to false if it is not required."
            ]
        },
        {
            "condition": "Check if negate flag is set to false",
            "attribute_path" : ["negate"], # Path to the negate attribute
            "values" : [false], # Desired value for negate (false)
            "policy_type" : "whitelist" # Ensuring negate is not true
        }
    ]
]

# General policy compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details