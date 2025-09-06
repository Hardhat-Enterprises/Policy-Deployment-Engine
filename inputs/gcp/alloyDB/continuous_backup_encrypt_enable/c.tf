resource "google_alloydb_cluster" "c" {
  location   = "us-central1"
  cluster_id = "cluster-cbk-on"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  continuous_backup_config {
    enabled = true
    encryption_config {
      kms_key_name = "projects/sec-keys-prod/locations/us-central1/keyRings/ring-a/cryptoKeys/ck-cmeb"
    }
  }
}
