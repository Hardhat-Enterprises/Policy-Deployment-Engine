resource "google_bigtable_instance" "nc123" {
  name = "nc123"
  instance_type = "DEVELOPMENT"
  
  cluster {
    cluster_id = "nc123"
    zone       = "us-central1-a"
  }
}