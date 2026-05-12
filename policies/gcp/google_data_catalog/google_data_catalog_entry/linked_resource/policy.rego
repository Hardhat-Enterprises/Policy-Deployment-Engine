package terraform.gcp.security.google_data_catalog.google_data_catalog_entry.linked_resource
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry is linked to an unapproved resource.",
    "remedies":["Link the entry only to approved GCP resources or approved resource prefixes."]},
    {
        "condition": "Linked resource must match an approved resource path.",
        "attribute_path" : ["linked_resource"],
        "values" : ["my/linked/resource"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
