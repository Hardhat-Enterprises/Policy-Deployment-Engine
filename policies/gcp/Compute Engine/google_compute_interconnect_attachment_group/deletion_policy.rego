package terraform.gcp.security.compute_engine.google_compute_interconnect_attachment_group.deletion_policy 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect_attachment_group.vars

conditions := [
    [
    {"situation_description" : "Attachment Group can be destroyed by Terraform.",
    "remedies":[ "Set deletion_policy to PREVENT."]},
    {
        "condition": "deletion_policy must be set to PREVENT.",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["PREVENT"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details