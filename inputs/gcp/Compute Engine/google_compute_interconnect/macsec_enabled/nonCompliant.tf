resource "google_compute_interconnect" "non_compliant_example_1" {
  name                 = "non-compliant-example-1"
  interconnect_type    = "DEDICATED"
  link_type            = "LINK_TYPE_ETHERNET_10G_LR"
  requested_link_count = 1
  location             = "syd-zone1-6"
  macsec_enabled       = false
}
