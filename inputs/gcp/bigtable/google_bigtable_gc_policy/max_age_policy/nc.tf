resource "google_bigtable_gc_policy" "nc123" {
  instance = "nc123"
  table    = "nc123"
  column_family = "nc123"

  max_age {
    days = 365
  }
}
