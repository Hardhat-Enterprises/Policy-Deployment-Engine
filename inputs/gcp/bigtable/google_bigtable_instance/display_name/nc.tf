resource "google_bigtable_instance" "nc123" {
  name = "nc123"
  display_name = ""
  
  cluster {
    cluster_id = "nc123"
    zone       = "us-central1-a"
  }
}