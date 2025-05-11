# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_active_directory_domain" "c" {
    project = "projects/1/locations/global/domains/pde.org.com"
    domain_name = "pde.org.com"
    locations = ["australia"]
    reserved_ip_range = "192.168.1.1/24"
    
    authorized_networks = ["192.168.1.0/24", "10.0.0.0/8"]
}