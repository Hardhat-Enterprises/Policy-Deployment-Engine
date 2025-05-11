# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_secret_manager_secret" "c" {
  secret_id = "compliant-secret"
  replication {
    auto {
      customer_managed_encryption {
        kms_key_name = "projects/premium-trainer-456719-j3/locations/global/keyRings/my-kr/cryptoKeys/my-key"
      }
    }
  }
}


