package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.parent_policy_tag
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.vars

conditions := [
    [
    {"situation_description" : "Data Catalog policy tag uses an unapproved parent policy tag.",
    "remedies":["Use an approved parent policy tag to keep the classification hierarchy correct."]},
    {
        "condition": "Parent policy tag must be in the approved list.",
        "attribute_path" : ["parent_policy_tag"],
        "values" : ["projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_parent"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
