package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_subnet.ip_cidr_range
import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_subnet.vars



conditions := [
    [
    {"situation_description" :"is using an unapproved subnet IP CIDR range",
    "remedies":["change the ip_cidr_range to 192.168.100.0/26"]},
   
    {
        "condition":"c1:  check the cloud vmware engine subnet IP CIDR range",
        "attribute_path" : ["ip_cidr_range"],
        "values" :["192.168.100.0/26"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details