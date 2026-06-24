resource "google_bigtable_table" "c" {
  project                 = "PDE"
  name                    = "c"
  instance_name           = "c"
  change_stream_retention = "24h"
}
