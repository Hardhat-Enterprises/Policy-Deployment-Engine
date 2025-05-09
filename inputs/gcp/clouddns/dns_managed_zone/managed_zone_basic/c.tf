# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dns_managed_zone" "c" {
    name = "example"
    project = "dns_managed_zone"
    dns_name = "PDE.example.com"
}
