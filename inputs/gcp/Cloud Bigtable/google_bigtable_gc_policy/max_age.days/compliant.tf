resource "google_bigtable_gc_policy" "compliant_example_1" {
  instance_name = "compliant_example_1"
  table         = "t"
  column_family = "cfc"

  max_age {
    days = 30
  }
}
