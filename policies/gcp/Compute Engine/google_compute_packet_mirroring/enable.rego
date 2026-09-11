package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.enable
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Set enable to TRUE."]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : [enable], 
        "values" : [TRUE], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details