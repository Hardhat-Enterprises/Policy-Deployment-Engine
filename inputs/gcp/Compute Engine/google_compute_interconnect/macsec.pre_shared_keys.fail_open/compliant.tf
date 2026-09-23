resource "google_compute_interconnect" "compliant_example_1" {
  name                 = "compliant-example-1"
  interconnect_type    = "DEDICATED"
  link_type            = "LINK_TYPE_ETHERNET_10G_LR"
  requested_link_count = 1
  location             = "syd-zone1-6"
  macsec_enabled       = true

  macsec {
    pre_shared_keys {
      name      = "key1"
      fail_open = false
    }
  }
}
