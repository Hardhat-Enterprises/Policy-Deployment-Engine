package terraform.gcp.security.Firebase.web_app.deletion_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Firebase.web_app.vars

conditions := [
    [
    {"situation_description" : "The Firebase web_app resource 'testfirebasewebapp-nc' is configured with 'deletion_policy' set to 'ABANDON'. This may leave underlying configurations or metadata undeleted, leading to compliance risks, residual data exposure, or resource mismanagement. To enforce proper lifecycle management, the deletion_policy must be set to 'DELETE'",
    "remedies":[  "Update the deletion_policy for the Firebase web_app resource to 'DELETE' instead of 'ABANDON'.",
      "Ensure the change is reviewed and approved according to organizational change management procedures.",
      "Verify that backups and retention requirements are satisfied before enforcing deletion."
]},
    {
        "condition": "Firebase web_app 'testfirebasewebapp-nc' has 'deletion_policy' set to 'ABANDON'. It should be set to '[\"DELETE\"]' to ensure that resources are fully removed when deleted.",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["DELETE"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details