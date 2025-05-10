# package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
package terraform.gcp.security.compute.instance.boot_disk
import data.terraform.gcp.helpers
# import data.terraform.gcp.security.<service>.<resource_type>.vars
import data.terraform.gcp.security.compute.instance.vars

conditions := [
    [
    {
        "situation_description" : "Instance boot disk is not using the required Debian 11 image",
        "remedies":[ "Set boot_disk.initialize_params.image to 'debian-cloud/debian-11'"]
    },
    {
        "condition": "Boot disk image must be 'debian-cloud/debian-11",
        "attribute_path" : ["boot_disk", 0, "initialize_params", 0, "image"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["debian-cloud/debian-11"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ],
    [
        {
        "situation_description" : "Instance boot disk size is beyond the range",
        "remedies":[ "Set boot_disk.initialize_params.size between 10 and 30 GB"]
       },
    {
        "condition": "Boot disk image must be within the range",
        "attribute_path" : ["boot_disk", 0, "initialize_params", 0, "size"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [10,30], # Values to compare against
        "policy_type" : "range" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
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

#..............................................................................................................................