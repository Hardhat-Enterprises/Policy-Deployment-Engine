

resource "google_dns_managed_zone" "c" {
    project = "dns_managed_zone"
    name = "private_zone"
    dns_name = "dns_private_zone"
    visibility = "private"

    private_visibility_config{
        networks{
            network_url = "pde.coding_for_yotham.net"
        }
    }
}
