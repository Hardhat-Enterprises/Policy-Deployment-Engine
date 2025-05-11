# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_active_directory_domain" "nc" {
    project = "projects/1/locations/global/domains/pde.org.com"
    domain_name = "pde-nc.org.com"
    locations = ["australia"]
    reserved_ip_range = "192.168.1.1/24"

    admin = "admin@gmail.com"
}