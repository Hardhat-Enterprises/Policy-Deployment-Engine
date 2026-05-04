resource "google_dns_response_policy" "c" {
  response_policy_name = "c"
  description          = "Compliant response policy with description"

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}