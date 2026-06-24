resource "google_kms_key_ring_import_job" "compliant_example_1" {
  import_job_id    = "compliant_example_1"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_4096_SHA256_AES_256" # allowed
  protection_level = "EXTERNAL"
}
