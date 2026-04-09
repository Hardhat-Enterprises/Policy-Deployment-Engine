# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_managed_kafka_cluster" "c" {
  cluster_id = "c"
  location   = "us-central1"
  project    = "my-project"

  capacity_config {
    vcpu_count   = 2
    memory_bytes = 2147483650
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "10.0.0.0/8" # ✅ Private subnet
      }
    }
    kms_key = google_kms_crypto_key.key.id
  }
}

resource "google_kms_key_ring" "key_ring" {
  name     = "secure-key-ring"
  location = "us-central1"
  project  = "my-project"
}

resource "google_kms_crypto_key" "key" {
  name     = "secure-key"
  key_ring = google_kms_key_ring.key_ring.id
}
