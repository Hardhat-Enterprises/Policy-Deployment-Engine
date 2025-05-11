# This is PER RESOURCE, so it should be in "policies/<CSP>/<SERVICE>/<RESOURCE>" (eg. policies/gcp/storage/bucket)

package terraform.gcp.security.iam.deny_policy.vars # Edit here

variables := {
    "friendly_resource_name": "GCP IAM DP", # Readable name of your resource (eg. "Cool GCP Storage Bucket")
    "resource_type":  "google_iam_deny_policy", # Your actual resource type  (eg. "google_storage_bucket")
    "resource_value_name" : "name" # How your resource is identified in the .json plan at planned_values.root_module.resources.values (eg. "name", "instance_id", etc.)
}