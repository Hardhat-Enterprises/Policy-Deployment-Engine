package terraform.gcp.security.deploy.target.run # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Cloud Run service location is not in approved secure regions",
    "remedies":[ "Deploy to approved secure regions only","Ensure service location meets security requirements"]},
    {
        "condition": "Cloud Run service must be deployed in approved secure locations",
            "attribute_path": ["run", 0, "location"],
            "values": [
                "projects/my-project-name/locations/us-central1",
                "projects/my-project-name/locations/us-east1",
                "projects/my-project-name/locations/europe-west1",
                "projects/my-project-name/locations/asia-southeast1"
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