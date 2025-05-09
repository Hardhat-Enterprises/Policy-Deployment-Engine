resource "google_dns_managed_zone" "c" {
    name = "peering-zone"
    project = "dns_managed_zone"
    dns_name = "pde.example1.com"
    visibility = "private"

    private_visibility_config {
      networks {
        network_url = "pde.example.com"
      }
    }
    peering_config {
      target_network {
        network_url = "google.target.com"
      }
    }
}
