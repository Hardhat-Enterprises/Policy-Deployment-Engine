resource "google_dns_response_policy" "nc" {
  response_policy_name = "nc"

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}