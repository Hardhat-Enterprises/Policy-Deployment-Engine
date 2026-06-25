resource "google_dns_policy" "compliant_example_1" {
  name           = "compliant_example_1"
  enable_logging = true

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}
