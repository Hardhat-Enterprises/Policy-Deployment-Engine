resource "google_bigtable_instance" "c123" {
  name = "c123"
  deletion_protection = true
  
  cluster {
    cluster_id = "c123"
    zone       = "us-central1-a"
  }
}
