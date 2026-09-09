resource "google_compute_service_attachment" "compliant_example_1" {
  name        = "compliant_example_1"
  region      = "australia-southeast1"
  description = "A service attachment configured with Terraform"
  project     = "pde"
  domain_names             = ["gcp.tfacc.hashicorptest.com."]
  enable_proxy_protocol    = true
  connection_preference    = "ACCEPT_MANUAL"
  nat_subnets              = ["google_compute_subnetwork.psc_ilb_nat.id"]
  target_service           = "google_compute_forwarding_rule.psc_ilb_target_service.id"
  show_nat_ips             = "false"
}