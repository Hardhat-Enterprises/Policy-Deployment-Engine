# resource "google_alloydb_backup" "backup_cmek_on" {
#   location     = "us-central1"
#   cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
#   project = "123"
#   backup_id = "backup_cmek_on"

#   encryption_config {
#     kms_key_name = "projects/p/locations/us-central1/keyRings/r/cryptoKeys/k"
#   }
# }
resource "google_alloydb_backup" "c" {
  location     = "us-central1"
  backup_id    = "alloydb-backup"
  cluster_name = "projects/p/locations/us-central1/clusters/cluster-c"
  project = "123"
  type = "ON_DEMAND"

  labels = {
    label = "key"
  }

  
}

