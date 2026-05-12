package terraform.gcp.security.google_data_catalog.google_data_catalog_entry.gcs_fileset_spec_file_patterns
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry uses an unapproved GCS file pattern.",
    "remedies":["Use only approved GCS bucket paths or prefixes in file patterns."]},
    {
        "condition": "GCS file patterns must match approved paths.",
        "attribute_path" : ["gcs_fileset_spec", 0, "file_patterns"],
        "values" : ["gs://my_bucket/file"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
