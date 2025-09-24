resource "google_bigtable_gc_policy" "c123" {
  instance = "c123"
  table    = "c123"
  column_family = "c123"

  max_age {
    days = 7
  }
}
