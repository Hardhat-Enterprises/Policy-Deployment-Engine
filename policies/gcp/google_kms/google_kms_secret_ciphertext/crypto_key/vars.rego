# This is PER RESOURCE, so it should be in "policies/<CSP>/<SERVICE>/<RESOURCE>" (eg. policies/gcp/storage/bucket)

package terraform.gcp.security.google_kms.google_kms_secret_ciphertext.crypto_key.vars # Edit here

variables := {
    "friendly_resource_name": "KMS secret Ciphertext", # Readable name of your resource (eg. "Cool GCP Storage Bucket")
    "resource_type":  "google_kms_secret_ciphertext", # Your actual resource type  (eg. "google_storage_bucket")
    "resource_value_name" : "name" # How your resource is identified in the .json plan at planned_values.root_module.resources (eg. "name", "instance_id", etc.)
}