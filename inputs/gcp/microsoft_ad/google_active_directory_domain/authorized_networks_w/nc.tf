# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_active_directory_domain" "nc" {
    project = "projects/1/locations/global/domains/pde.org.com"
    domain_name = "pde-nc.org.com"
    locations = ["australia"]
    reserved_ip_range = "192.168.1.1/24"
    
    authorized_networks = ["1.1.1.1/32","8.8.8.8/32"]
}