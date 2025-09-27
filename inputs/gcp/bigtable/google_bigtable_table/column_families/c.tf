resource "google_bigtable_table" "c123" {
  name          = "c123"
  instance_name = "c123"
  column_family {
    family = "c123"
  }
}
