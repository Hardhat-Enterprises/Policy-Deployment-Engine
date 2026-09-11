package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.region 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Set the region to a whitelist region"]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : [region], 
        "values" : [australia-east1], 
        "policy_type" : "whitelist" 
    }
    ]
]

# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details