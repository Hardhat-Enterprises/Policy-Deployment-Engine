resource "google_bigtable_table" "c123" {
  name          = "c123"
  instance_name = "c123"
  deletion_protection = "PROTECTED"
}
