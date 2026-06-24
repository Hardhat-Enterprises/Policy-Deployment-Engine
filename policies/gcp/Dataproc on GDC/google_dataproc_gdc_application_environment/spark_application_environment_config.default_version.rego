package terraform.gcp.security.google_dataproc_on_gdc.application_environment.spark_application_environment_config  
import data.terraform.helpers
import data.terraform.gcp.security.google_dataproc_on_gdc.application_environment.vars

conditions := [
    [
    {
        "situation_description" : "The default dataproc version to use for applications is still supported ",
        "remedies":["change Dataproc version"],
    },
    {
        "condition": "check whether default Dataproc version is supported version 2.3.x versions",
        "attribute_path" : ["spark_application_environment_config", 0, "default_version"],
        "values" : ["2.3.*",[["11", "10", "9", "8", "7"]]],
        "policy_type" : "pattern_whitelist"
    },
    {
        "condition": "check whether default Dataproc version is supported 2.2.x versions",
        "attribute_path" : ["spark_application_environment_config", 0, "default_version"],
        "values" : ["2.2.*",[["64"]]],
        "policy_type" : "pattern_whitelist"
    },
    {
        "condition": "check whether default Dataproc version is supported on 2.0.x versions",
        "attribute_path" : ["spark_application_environment_config", 0, "default_version"],
        "values" : ["2.0.*",[["149", "147", "146", "145", "144"]]],
        "policy_type" : "pattern_whitelist"
    }
    ]
]





message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details