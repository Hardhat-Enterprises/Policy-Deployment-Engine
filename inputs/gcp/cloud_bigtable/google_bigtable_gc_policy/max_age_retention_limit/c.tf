resource "google_bigtable_gc_policy" "c" {
  instance_name = "c"
  table         = "t"
  column_family = "cfc"

  max_age {
    days = 30
  }
}
