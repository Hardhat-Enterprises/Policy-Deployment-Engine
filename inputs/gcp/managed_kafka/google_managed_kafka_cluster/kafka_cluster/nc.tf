resource "google_managed_kafka_cluster" "nc" {
  cluster_id = "nc"
  location   = "us-central1"
  project    = "my-project"

  capacity_config {
    vcpu_count   = 4
    memory_bytes = 2147483350
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = ""
      }
    }
    
    kms_key = google_kms_crypto_key.key_nc.id
  }
}

resource "google_kms_key_ring" "key_ring_nc" {
  name     = "insecure-key-ring"
  location = "us-central1"
  project  = "my-project"
}

resource "google_kms_crypto_key" "key_nc" {
  name     = "insecure-key"
  
  key_ring = google_kms_key_ring.key_ring_nc.id
}
