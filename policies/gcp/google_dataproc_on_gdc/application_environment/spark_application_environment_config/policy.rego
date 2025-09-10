package terraform.gcp.security.google_dataproc_on_gdc.application_environment.spark_application_environment_config # Edit here 
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
        "values" : ["1.3.95", "1.4.77", "1.5.53", "2.0.27", "0.x", "1.0.x", "1.1.x", "1.2.x"],
        "policy_type" : "blacklist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details