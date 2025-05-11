# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_active_directory_domain_trust" "c" {
    project = "projects/1/locations/global/domains/pde.org.com"
    target_domain_name = "pde-gcp.com"
    trust_type = "FOREST"
    trust_direction = "OUTBOUND"
    target_dns_ip_addresses = ["10.1.0.100"]  # example of the target dns server ip addresses which can resolve the remote domain involved in the trust. 
    trust_handshake_secret = "test1"
    domain = "pde.org.com"
    
    selective_authentication = true
}

