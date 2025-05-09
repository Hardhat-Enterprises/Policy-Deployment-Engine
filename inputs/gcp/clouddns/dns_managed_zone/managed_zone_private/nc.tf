# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_managed_zone" "nc" {
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