package terraform.gcp.security.google_kms.google_kms_secret_ciphertext.vars

variables := {
    "friendly_resource_name": "KMS secret Ciphertext", # Readable name of your resource (eg. "Cool GCP Storage Bucket")
    "resource_type":  "google_kms_secret_ciphertext", # Your actual resource type  (eg. "google_storage_bucket")
    "resource_value_name" : "crypto_key" 
    }