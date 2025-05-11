# This is PER RESOURCE, so it should be in "policies/<CSP>/<SERVICE>/<RESOURCE>" (eg. policies/gcp/storage/bucket)

package terraform.gcp.security.iam.folders_policy_binding.vars # Edit here

variables := {
    "friendly_resource_name": "GCP IAM FPB", # Readable name of your resource (eg. "Cool GCP Storage Bucket")
    "resource_type":  "google_iam_folders_policy_binding", # Your actual resource type  (eg. "google_storage_bucket")
    "resource_value_name" : "policy_binding_id" # How your resource is identified in the .json plan at planned_values.root_module.resources.values (eg. "name", "instance_id", etc.)
}