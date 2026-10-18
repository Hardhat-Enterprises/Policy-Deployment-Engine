resource "google_compute_service_attachment" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  region      = "australia-southeast1"
  description = "A service attachment configured with Terraform"
  project     = "pde"
  domain_names             = ["gcp.tfacc.hashicorptest.com."]
  enable_proxy_protocol    = false
  connection_preference    = "ACCEPT_MANUAL"
  nat_subnets              = ["google_compute_subnetwork.psc_ilb_nat.id"]
  target_service           = "google_compute_forwarding_rule.psc_ilb_target_service.id"

   consumer_accept_lists {
    network_url      = "projects/pde/global/networks/my-network"
    connection_limit = 5
  }
}