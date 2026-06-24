package terraform.gcp.security.Firebase_Data_Connect.google_firebase_data_connect_service.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.Firebase_Data_Connect.google_firebase_data_connect_service.vars

conditions := [
    [
    {"situation_description" : "The resource is configured with deletion_policy set to DEFAULT, which does not guarantee forced removal and may leave residual data or resources unmanaged, leading to compliance and security risks.",
    "remedies":[ "Update the deletion_policy attribute from DEFAULT to FORCE to ensure complete and compliant deletion of resources.",
                "Review all resources using DEFAULT deletion policy and migrate them to FORCE where applicable.",
                "Establish monitoring to prevent future use of DEFAULT deletion policy."
]},
    {
        "condition": "deletion_policy set to FORCE",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["FORCE"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details