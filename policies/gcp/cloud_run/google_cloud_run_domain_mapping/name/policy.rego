package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.name
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {
            "situation_description": "Cloud Run domain mapping name does not use an approved company domain",
            "remedies": [
                "Change the domain name to an approved company domain",
                "Use a domain that matches the required naming pattern"
            ]
        },
    {
            "condition": "Domain name must match the approved company domain pattern",
            "attribute_path": ["name"],
            "values": ["app.company.com"],
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