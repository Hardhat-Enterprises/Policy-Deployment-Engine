# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_policy" "nc" {
    name = "alt_server_config"
    project = "alt_server"

    alternative_name_server_config {
        target_name_servers {
        ipv4_address = ""
        }
    }
}