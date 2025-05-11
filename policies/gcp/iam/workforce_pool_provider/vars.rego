# This is PER RESOURCE, so it should be in "policies/<CSP>/<SERVICE>/<RESOURCE>" (eg. policies/gcp/storage/bucket)

package terraform.gcp.security.iam.workforce_pool_provider.vars # Edit here

variables := {
    "friendly_resource_name": "GCP IAM WFPP", # Readable name of your resource (eg. "Cool GCP Storage Bucket")
    "resource_type":  "google_iam_workforce_pool_provider", # Your actual resource type  (eg. "google_storage_bucket")
    "resource_value_name" : "provider_id" # How your resource is identified in the .json plan at planned_values.root_module.resources.values (eg. "name", "instance_id", etc.)
}