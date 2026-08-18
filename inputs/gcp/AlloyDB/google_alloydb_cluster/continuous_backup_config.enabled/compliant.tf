resource "google_alloydb_cluster" "compliant_example_1" {
  cluster_id = "c1"
  location   = "us-central1"
  project = "123"

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
