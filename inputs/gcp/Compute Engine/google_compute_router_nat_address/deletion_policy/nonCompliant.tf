resource "google_compute_router_nat_address" "non_compliant_example_1" {
  router          = "example-router"
  router_nat      = "non-compliant-example-1"
  region          = "australia-southeast1"
  nat_ips         = ["https://www.googleapis.com/compute/v1/projects/example-project/regions/australia-southeast1/addresses/example-nat-ip"]
  deletion_policy = "ABANDON"
}
