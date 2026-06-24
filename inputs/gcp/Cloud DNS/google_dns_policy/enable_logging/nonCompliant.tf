resource "google_dns_policy" "non_compliant_example_1" {
  name           = "non_compliant_example_1"
  enable_logging = false

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}
