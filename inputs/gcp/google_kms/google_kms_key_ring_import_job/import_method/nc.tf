# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Unsupported import_method
resource "google_kms_key_ring_import_job" "nc_method" {
  import_job_id    = "bad-import-job"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA1_AES_256"             # not in whitelist
  protection_level = "SOFTWARE"
}

# EXTERNAL protection_level requires a stronger method
resource "google_kms_key_ring_import_job" "nc_external" {
  import_job_id    = "external-import-job"
  key_ring         = "projects/my-project/locations/global/keyRings/my-ring"
  import_method    = "RSA_OAEP_3072_SHA1_AES_256"  # too weak for EXTERNAL
  protection_level = "EXTERNAL"
}