# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_kms_key_ring_import_job" "c" {
  import_job_id    = "good-import-job"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA256_AES_256"  # allowed
  protection_level = "HSM"
}