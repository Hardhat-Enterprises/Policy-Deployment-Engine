package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.image_type
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_node_pool.vars

 conditions := [
 [
    {"situation_description" : "Enforcing the image type to be the supported system",
    "remedies":[ "Change image type to a supported system." ],},
    {
        "condition": "Test if the image type is supported",
        "attribute_path" : ["config", "image_type"],
        "values" : ["cos", "cos_cgv2", "ubuntu", "ubuntu_cgv2", "ubuntu_containerd", "windows"],
        "policy_type" : "whitelist" 
    }
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details