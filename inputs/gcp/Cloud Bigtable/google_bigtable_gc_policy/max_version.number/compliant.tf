resource "google_bigtable_gc_policy" "compliant_example_1" {
  instance_name = "compliant_example_1"
  table         = "t"
  column_family = "cf"

  max_version {
    number = 3
  }
}
