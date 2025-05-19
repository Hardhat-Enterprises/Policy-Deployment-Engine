resource "google_kms_crypto_key_version" "c" {
  
  crypto_key = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  
  # Compliant: state is set to ENABLED
  

}