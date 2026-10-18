package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.enable
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "Enable controls whether the mirroring policy is enforced",
    "remedies":[ "Set enable to TRUE."]},
    {
        "condition": "enable must be TRUE",
        "attribute_path" : ["enable"], 
        "values" : ["TRUE"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details