resource "google_bigtable_instance" "c123" {
  name = "c123"
  instance_type = "PRODUCTION"
  
  cluster {
    cluster_id = "c123"
    zone       = "us-central1-a"
  }
}
