package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_external_address.internal_ip
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_external_address.vars



conditions := [
    [
    {"situation_description" :"is using an unapproved internal IP address",
    "remedies":["change the internal_ip to 192.168.0.66"]},
   
    {
        "condition":"c1:  check the cloud vmware engine external address internal IP",
        "attribute_path" : ["internal_ip"],
        "values" :["192.168.0.66"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details