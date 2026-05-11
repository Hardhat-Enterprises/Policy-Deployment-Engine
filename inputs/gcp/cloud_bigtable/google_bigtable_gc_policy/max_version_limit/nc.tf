resource "google_bigtable_gc_policy" "nc" {
  instance_name = "nc"
  table         = "t"
  column_family = "cf"

  max_version {
    number = 10
  }
}
