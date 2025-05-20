# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_container_cluster" "c"  {
  name     = "gke-policy-cluster"
  location = "AU"

  dns_config {
    cluster_dns                   = "CLOUD_DNS"
    cluster_dns_scope             = "VPC_SCOPE"
    cluster_dns_domain            = "cluster.local"
  }

}

