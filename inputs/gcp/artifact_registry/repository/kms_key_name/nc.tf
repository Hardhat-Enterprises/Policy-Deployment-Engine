/*Resource type - kms_key_name (encryption):
The Cloud KMS resource name of the customer managed encryption key that’s used to encrypt the contents of the Repository. 
Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. 
This value may not be changed after the Repository has been created.*/

# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_artifact_registry_repository" "nc" {
  repository_id = "test-repo-nc"
  format        = "DOCKER"
  location      = "AU"
  
  #No kms_key_name provided: this is non-compliant
  #This does not include kms_key_name, so it’s non-compliant as it relies on the default Google-managed encryption.

project = "sunny-lore-458707-v4"

}
