resource "google_alloydb_cluster" "c" {
  cluster_id = "c"
  location   = "us-central1"

  network_config {
    network = "projects/p/global/networks/prod-vpc"
  }

  continuous_backup_config {
    enabled = true
    encryption_config {
      kms_key_name = "projects/p/locations/us-central1/keyRings/kr/cryptoKeys/key"
    }
  }
}
