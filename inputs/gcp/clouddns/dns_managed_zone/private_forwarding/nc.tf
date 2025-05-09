# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_managed_zone" "nc" {
    name = "private_forwarding"
    project = "dns_managed_zone"
    dns_name = "pde.example.com"
    forwarding_config{
        target_name_servers{
            ipv4_address = ""
        }
        target_name_servers{
            ipv4_address = ""
        } 
    }
}