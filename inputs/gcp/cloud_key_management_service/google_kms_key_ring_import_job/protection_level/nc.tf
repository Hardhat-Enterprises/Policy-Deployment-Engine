# Violation 1: SOFTWARE is not allowed
resource "google_kms_key_ring_import_job" "nc" {
  import_job_id    = "nc"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_4096_SHA256_AES_256"
  protection_level = "EXTERNAL" #  not in [HSM, EXTERNAL]
}