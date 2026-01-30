
resource "google_alloydb_backup" "c" {
  location     = "us-central1"  
  backup_id    = "bk-cmek-ok"   
  cluster_name = "projects/pde-demo/locations/us-central1/clusters/cluster-1"  

  encryption_config {
    
    kms_key_name = "projects/sec-keys-prod/locations/us-central1/keyRings/ring-a/cryptoKeys/ck-cmek-1"
  }
}
