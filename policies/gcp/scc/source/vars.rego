package terraform.gcp.security.scc.source.vars


variables := {
    "friendly_resource_name": "SCC Source", # eg., "GCS Bucket",
    "resource_type":  "google_scc_source", # eg., "google_storage_bucket"
    "resource_value_name" : "display_name" # eg., "name"
}
