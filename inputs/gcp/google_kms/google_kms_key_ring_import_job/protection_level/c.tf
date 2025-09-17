resource "google_kms_key_ring_import_job" "c1" {
  import_job_id    = "c1"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_4096_SHA256_AES_256"
  protection_level = "HSM" # whitelisted
}
