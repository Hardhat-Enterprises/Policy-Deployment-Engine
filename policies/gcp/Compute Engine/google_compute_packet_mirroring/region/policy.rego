package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.region 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Set the region to a whitelist region"]},
    {
        "condition": "region must be in the whitelist",
        "attribute_path" : ["region"], 
        "values" : ["australia-east1"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details