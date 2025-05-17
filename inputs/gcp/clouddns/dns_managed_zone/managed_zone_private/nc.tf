

resource "google_dns_managed_zone" "nc" {
    project = "dns_managed_zone"
    name = "private_zone"
    dns_name = "dns_private_zone"
    visibility = "public"

    private_visibility_config{
        networks{
            network_url = "pde.coding_for_yotham.net"
        }
    }
}