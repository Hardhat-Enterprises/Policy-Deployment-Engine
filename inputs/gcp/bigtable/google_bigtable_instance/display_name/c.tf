resource "google_bigtable_instance" "c123" {
  name = "c123"
  display_name = "Production Bigtable Instance"
  
  cluster {
    cluster_id = "c123"
    zone       = "us-central1-a"
  }
}
