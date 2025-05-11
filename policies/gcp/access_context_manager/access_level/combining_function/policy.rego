package terraform.gcp.security.access_context_manager.access_level.combining_function # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.access_level.vars

# Defining the condition for the combining function
conditions := [
    [
        {
            "situation_description" : "Combining function is set to 'AND'",
            "remedies": [
                "Ensure that the combining function is set to a valid value such as 'OR' or 'AND'."
            ]
        },
        {
            "condition": "Check if combining_function is set to 'AND'",
            "attribute_path" : ["combining_function"], # Path to the combining function attribute
            "values" : ["AND"], # Desired value for 'combining_function'
            "policy_type" : "whitelist" # Enforcing the whitelist condition
        }
    ]
]

# General policy compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details