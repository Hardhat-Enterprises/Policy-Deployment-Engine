resource "google_dns_policy" "nc" {
  name           = "nc"
  enable_logging = false

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}