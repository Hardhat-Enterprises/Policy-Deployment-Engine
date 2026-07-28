resource "google_bigtable_table" "non_compliant_example_1" {
  project                 = "PDE"
  name                    = "non_compliant_example_1"
  instance_name           = "nc"
  change_stream_retention = "0"
}
