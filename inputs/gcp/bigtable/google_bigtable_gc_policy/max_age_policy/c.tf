resource "google_bigtable_gc_policy" "c123" {
  instance_name = "c123"
  table         = "c123"
  column_family = "c123"

  max_age {
    days = 7
  }
}
