package terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.vars


conditions := [
    [
    {"situation_description" : "IAM policy must not grant overly broad roles like Owner or Editor",
    "remedies": ["remove roles/owner and roles/editor from IAM policy "]
    
    },
    {
        "condition": "c1 : check iam_policy does not include risky roles",
    
        "attribute_path" : ["policy_data"],
        "values" : ["\"role\":\"roles/*\"", [["viewer"]]],
        "policy_type" :  "pattern whitelist"
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details