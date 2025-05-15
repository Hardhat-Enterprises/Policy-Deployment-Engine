# Violation 1: SOFTWARE is not allowed
resource "google_kms_key_ring_import_job" "nc_pl" {
  import_job_id    = "job-01"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_4096_SHA256_AES_256"
  protection_level = "SOFTWARE"                                 #  not in [HSM, EXTERNAL]
}

# Violation 2: import_job_id contains invalid character '@'
resource "google_kms_key_ring_import_job" "nc_id" {
  import_job_id    = "bad@id"                                    #  invalid per regex
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_4096_SHA256_AES_256"
  protection_level = "EXTERNAL"                                  #  this part is fine
}