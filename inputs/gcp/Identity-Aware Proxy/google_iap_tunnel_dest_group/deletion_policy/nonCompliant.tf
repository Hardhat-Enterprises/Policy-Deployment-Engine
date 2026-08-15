resource "google_iap_tunnel_dest_group" "non_compliant_example_1" {
  group_name = "non-compliant-example-1"
  region     = "australia-southeast1"

  deletion_policy = "DELETE"
}

resource "google_iap_tunnel_dest_group" "non_compliant_example_2" {
  group_name = "non-compliant-example-2"
  region     = "australia-southeast1"

  deletion_policy = "ABANDON"
}