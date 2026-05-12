package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_member.taxonomy
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_member.vars

conditions := [
    [
    {"situation_description" : "IAM member is attached to an unapproved Data Catalog taxonomy.",
    "remedies":["Attach IAM only to approved Data Catalog taxonomys."]},
    {
        "condition": "Taxonomy must be in the approved list.",
        "attribute_path" : ["taxonomy"],
        "values" : ["approved_taxonomy"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
