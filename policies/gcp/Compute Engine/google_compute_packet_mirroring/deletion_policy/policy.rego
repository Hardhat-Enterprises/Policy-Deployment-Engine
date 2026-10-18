package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.deletion_policy 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "Deletion policy controls whether this resource can be destroyed",
    "remedies":[ "Set deletion_policy to PREVENT to protect the the mirroring policy from deletion"]},
    {
        "condition": "deletion_policy must be PREVENT",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["PREVENT"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details