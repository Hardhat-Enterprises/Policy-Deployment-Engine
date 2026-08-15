resource "google_iap_tunnel_dest_group" "compliant_example_1" {
  group_name = "compliant-example-1"
  region     = "australia-southeast1"

  deletion_policy = "PREVENT"
}