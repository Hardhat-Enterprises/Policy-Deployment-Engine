

resource "google_dns_managed_zone" "c" {
    name = "private_forwarding"
    project = "dns_managed_zone"
    dns_name = "pde.example.com"
    forwarding_config{
        target_name_servers{
            ipv4_address = "139.0.0.1"
        }
        target_name_servers{
            ipv4_address = "172.20.30.1"
        } 
    }
}
