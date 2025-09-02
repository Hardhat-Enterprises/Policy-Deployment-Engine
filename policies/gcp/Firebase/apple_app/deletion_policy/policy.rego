package terraform.gcp.security.Firebase.apple_app.deletion_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Firebase.apple_app.vars

conditions := [
    [
    {"situation_description" : "The Firebase apple_app resource 'testfirebaseappleapp-nc' is configured with 'deletion_policy' set to 'ABANDON'. This may leave underlying configurations or metadata undeleted, leading to compliance risks, residual data exposure, or resource mismanagement. To enforce proper lifecycle management, the deletion_policy must be set to 'DELETE'",
    "remedies":[  "Update the deletion_policy for the Firebase apple_app resource to 'DELETE' instead of 'ABANDON'.",
      "Ensure the change is reviewed and approved according to organizational change management procedures.",
      "Verify that backups and retention requirements are satisfied before enforcing deletion."
]},
    {
        "condition": "Firebase apple_app 'testfirebaseappleapp-nc' has 'deletion_policy' set to 'ABANDON'. It should be set to '[\"DELETE\"]' to ensure that resources are fully removed when deleted.",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["DELETE"], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details