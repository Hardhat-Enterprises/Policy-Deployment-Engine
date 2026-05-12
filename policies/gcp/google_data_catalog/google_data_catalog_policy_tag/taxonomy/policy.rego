package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.taxonomy
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.vars

conditions := [
    [
    {"situation_description" : "Data Catalog policy tag is assigned to an unapproved taxonomy.",
    "remedies":["Use an approved taxonomy for the policy tag."]},
    {
        "condition": "Taxonomy must be in the approved list.",
        "attribute_path" : ["taxonomy"],
        "values" : ["projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
