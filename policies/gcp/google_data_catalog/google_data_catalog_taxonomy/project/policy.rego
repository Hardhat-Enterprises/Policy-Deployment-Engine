package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy.project
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy.vars

conditions := [
    [
    {"situation_description" : "Data Catalog taxonomy is created in an unapproved project.",
    "remedies":["Use an approved GCP project for the Data Catalog taxonomy."]},
    {
        "condition": "Project must be in the approved list.",
        "attribute_path" : ["project"],
        "values" : ["gcp-project-12345"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
