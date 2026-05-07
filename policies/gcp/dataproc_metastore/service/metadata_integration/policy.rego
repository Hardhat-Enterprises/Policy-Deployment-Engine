package terraform.gcp.security.dataproc_metastore.service.metadata_integration 
import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars


conditions := [
    [
    {"situation_description" : "Metastore metdata to be synced to Data catalog",
    "remedies":[ "Set metadata intergration, data catalog, enabled to true"]},
    {
        "condition": "Data catalog sync enabled",
        "attribute_path" : ["metadata_integration", 0, "data_catalog_config", 0, "enabled"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details