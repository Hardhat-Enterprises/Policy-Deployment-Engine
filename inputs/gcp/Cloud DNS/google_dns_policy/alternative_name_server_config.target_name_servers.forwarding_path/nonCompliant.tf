resource "google_dns_policy" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
  project = "demo-project"

  alternative_name_server_config {
    target_name_servers {
      ipv4_address    = "172.16.1.10"
      forwarding_path = "default"
    }
  }

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}
