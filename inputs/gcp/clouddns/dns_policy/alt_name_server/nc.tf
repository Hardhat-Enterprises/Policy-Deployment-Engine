

resource "google_dns_policy" "nc" {
    name = "alt_server_config"
    project = "alt_server"

    alternative_name_server_config {
        target_name_servers {
        ipv4_address = ""
        }
    }
}