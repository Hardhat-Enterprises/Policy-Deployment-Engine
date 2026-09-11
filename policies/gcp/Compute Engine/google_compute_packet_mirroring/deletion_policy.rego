package terraform.gcp.security.compute_engine.google_compute_packet_mirroring.deletion_policy 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.vars

conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Something that fixes the issues in this situation","You can have multiple items in the array"]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : [deletion_policy], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [PREVENT], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

opa eval ... data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.deletion_policy.message
message := helpers.get_multi_summary(conditions, vars.variables).message
opa eval ... data.terraform.gcp.security.compute_engine.google_compute_packet_mirroring.deletion_policy.details
details := helpers.get_multi_summary(conditions, vars.variables).details