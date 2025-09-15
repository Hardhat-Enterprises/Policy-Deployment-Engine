resource "google_alloydb_cluster" "c" {
  cluster_id = "cluster-secure"
  location   = "us-central1"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  # CMEK on primary data
  encryption_config {
    kms_key_name = "projects/sec-keys-prod/locations/us-central1/keyRings/ring-a/cryptoKeys/key-a"
  }

  # Continuous backup enabled + CMEK (if your policy checks this)
  continuous_backup_config {
    enabled              = true
    recovery_window_days = 14
    encryption_config {
      kms_key_name = "projects/sec-keys-prod/locations/us-central1/keyRings/ring-a/cryptoKeys/key-a"
    }
  }

  initial_user {
    user     = "admin"
    password = "ChangeMe-Strong123!"
  }
}
