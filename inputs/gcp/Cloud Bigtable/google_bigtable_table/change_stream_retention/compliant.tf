resource "google_bigtable_table" "compliant_example_1" {
  project                 = "PDE"
  name                    = "compliant_example_1"
  instance_name           = "c"
  change_stream_retention = "24h"
}
