resource "google_alloydb_cluster" "nc" {
  cluster_id = "cluster-insecure"
  location   = "us-central1"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  # ❌ No CMEK set for primary data (omit the encryption_config block)
  # encryption_config {}

  # ❌ Continuous backup disabled / missing CMEK
  continuous_backup_config {
    enabled = false
    # encryption_config { kms_key_name = "" }  # intentionally omitted
  }

  initial_user {
    user     = "admin"
    password = "weakpass"
  }
}
