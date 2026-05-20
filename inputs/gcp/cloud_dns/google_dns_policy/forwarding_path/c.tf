resource "google_dns_policy" "c" {
  name    = "c"
  project = "demo-project"

  alternative_name_server_config {
    target_name_servers {
      ipv4_address    = "172.16.1.10"
      forwarding_path = "private"
    }
  }

  networks {
    network_url = "projects/demo-project/global/networks/default"
  }
}