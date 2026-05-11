resource "google_bigtable_table" "nc" {
  project                 = "PDE"
  name                    = "nc"
  instance_name           = "nc"
  change_stream_retention = "0"
}
