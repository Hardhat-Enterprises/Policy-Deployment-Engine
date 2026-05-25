resource "google_dns_policy" "c" {
  name           = "c"
  enable_logging = true

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}