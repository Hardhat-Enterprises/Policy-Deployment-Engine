resource "google_managed_kafka_cluster" "c" {
  cluster_id = "c"
  location   = "us-central1"
  project    = "123"

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/my-project/regions/us-central1/subnetworks/private-subnet"
      }
    }
    kms_key = google_kms_crypto_key.key.id
  }
}

# Key ring for CMEK
resource "google_kms_key_ring" "key_ring" {
  name     = "example-key-ring"
  location = "us-central1"
  project  = "123"
}

# Crypto key for CMEK
resource "google_kms_crypto_key" "key" {
  name     = "example-key"
  key_ring = google_kms_key_ring.key_ring.id

}
