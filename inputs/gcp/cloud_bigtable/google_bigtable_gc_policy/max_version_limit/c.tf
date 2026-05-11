resource "google_bigtable_gc_policy" "c" {
  instance_name = "c"
  table         = "t"
  column_family = "cf"

  max_version {
    number = 3
  }
}
