resource "google_kms_key_ring_import_job" "c" {
  import_job_id    = "good-import-job"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA256_AES_256"  # allowed
  protection_level = "HSM"
}