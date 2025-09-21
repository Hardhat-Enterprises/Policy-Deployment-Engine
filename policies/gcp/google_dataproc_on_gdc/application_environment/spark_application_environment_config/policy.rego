package terraform.gcp.security.google_dataproc_on_gdc.application_environment.spark_application_environment_config  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_dataproc_on_gdc.application_environment.vars

conditions := [
    [
    {"situation_description" : "The location of the application environment resides in approved Australian regions",
    "remedies":[ "change location of application environment"]},
    {
        "condition": "Test whether application environment is residing in an approved region",
        "attribute_path" : ["location"], 
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ],
    [
    {"situation_description" : "The default dataproc version to use for applications is still supported ",
    "remedies":[ "change Dataproc version"]},
    {
        "condition": "check whether default Dataproc version is supported",
        "attribute_path" : ["spark_application_environment_config", 0, "default_version"], 
        "values" : ["2.3.*", "2.2.64","2.1.96", "2.0.*",[["11,", "10", "9", "8", "7"],["149", "147", "146", "145", "144"]]],
        "policy_type" : "pattern_whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details