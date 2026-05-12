package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag_iam_binding.policy_tag
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag_iam_binding.vars

conditions := [
    [
    {"situation_description" : "IAM binding is attached to an unapproved Data Catalog policy tag.",
    "remedies":["Attach IAM only to approved Data Catalog policy tags."]},
    {
        "condition": "Policy Tag must be in the approved list.",
        "attribute_path" : ["policy_tag"],
        "values" : ["projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_policy_tag"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
