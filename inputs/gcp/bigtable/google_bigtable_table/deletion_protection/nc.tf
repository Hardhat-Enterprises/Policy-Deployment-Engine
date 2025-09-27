resource "google_bigtable_table" "nc123" {
  name          = "nc123"
  instance_name = "nc123"
  deletion_protection = "UNPROTECTED"
}