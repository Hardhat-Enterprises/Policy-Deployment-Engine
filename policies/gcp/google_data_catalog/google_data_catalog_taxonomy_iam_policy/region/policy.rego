package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_policy.region
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_policy.vars

conditions := [
    [
    {"situation_description" : "Data Catalog taxonomy IAM policy is created in an unapproved region.",
    "remedies":["Use an approved region for the Data Catalog taxonomy IAM policy."]},
    {
        "condition": "Region must be in the approved list.",
        "attribute_path" : ["region"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
