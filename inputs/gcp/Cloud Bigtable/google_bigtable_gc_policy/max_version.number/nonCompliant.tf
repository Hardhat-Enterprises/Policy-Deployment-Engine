resource "google_bigtable_gc_policy" "non_compliant_example_1" {
  instance_name = "non_compliant_example_1"
  table         = "t"
  column_family = "cf"

  max_version {
    number = 10
  }
}
