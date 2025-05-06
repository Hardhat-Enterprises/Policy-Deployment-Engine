# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_kms_crypto_key_version" "nc" {
  
  crypto_key = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  
  # Non- Compliant: state is set to DISABLED
  state      = "DISABLED"
}
  
