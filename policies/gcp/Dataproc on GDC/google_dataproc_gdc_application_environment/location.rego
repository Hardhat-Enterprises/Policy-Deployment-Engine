package terraform.gcp.security.google_dataproc_on_gdc.google_dataproc_gdc_application_environment.location
import data.terraform.helpers
import data.terraform.gcp.security.google_dataproc_on_gdc.google_dataproc_gdc_application_environment.vars

conditions := [
    [
    {
        "situation_description" : "The location of the application environment resides in approved Australian regions",
        "remedies":[ "change location of application environment"],
    },
    {
        "condition": "Test whether application environment is residing in an approved region",
        "attribute_path" : ["location"], 
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]





message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details