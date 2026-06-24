resource "google_bigtable_gc_policy" "nc" {
  instance_name = "nc"
  table         = "t"
  column_family = "ncf"

  max_age {
    days = 180
  }
}
