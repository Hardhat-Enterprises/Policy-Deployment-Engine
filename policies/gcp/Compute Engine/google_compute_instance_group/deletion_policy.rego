package terraform.gcp.security.compute_engine.google_compute_instance_group.deletion_policy 

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group.vars

conditions := [
    [
        {
            "situation_description" : "Instance Group can be destroyed by Terraform.",
            "remedies":["Set deletion_policy to PREVENT"]
        },
        {
            "condition": "A message about what the condition does",
            "attribute_path" : [deletion_policy], 
            "values" : [PREVENT], 
            "policy_type" : "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details