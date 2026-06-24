package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.encryption_config_kms_key
import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.vars


conditions := [
    [
    {"situation_description" : "To ensure data encryption make sure kms key is located in Australian regions ",
    "remedies":[ "Change kms key location to reside in australia-southeast1 or australia-southeast2 "]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : ["encryption_config", 0, "kms_key"], 
        "values" : ["projects-example/australia-southeast1/dpm-ring/metastore-cmek/", "projects-example/australia-southeast2/dpm-ring/metastore-cmek/"], 
        "policy_type" : "whitelist" 
    }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
