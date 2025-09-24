# Unsupported import_method
resource "google_kms_key_ring_import_job" "nc1" {
  import_job_id    = "nc1"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA1_AES_256" # not in whitelist
  protection_level = "SOFTWARE"
}

# EXTERNAL protection_level requires a stronger method
resource "google_kms_key_ring_import_job" "nc2" {
  import_job_id    = "nc2"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA1_AES_256" # too weak for EXTERNAL
  protection_level = "EXTERNAL"
}