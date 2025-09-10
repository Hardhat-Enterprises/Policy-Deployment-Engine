package terraform.gcp.security.dataproc_metastore.service.encryption_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars


conditions := [
    [
    {"situation_description" : "To ensure data encryption make sure kms key is located in Australiancregions ",
    "remedies":[ "Change kms key location to reside in australia-southeast1 or australia-southeast2 "]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : ["encryption_config", 0, "kms_key"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["projects-example/*/dpm-ring/metastore-cmek/",[["australia-southeast1", "australia-southeast2"]]], # Values to compare against
        "policy_type" : "patern_whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details