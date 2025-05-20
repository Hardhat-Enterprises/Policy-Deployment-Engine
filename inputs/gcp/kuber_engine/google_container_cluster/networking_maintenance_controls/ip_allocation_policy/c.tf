# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
  name     = "compliant-ip-alloc"
  location = "us-central1"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.100.0.0/14"
    services_ipv4_cidr_block = "10.96.0.0/20"
  }
}
