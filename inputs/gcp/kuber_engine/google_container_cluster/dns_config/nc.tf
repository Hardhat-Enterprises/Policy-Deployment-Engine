# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc"  {
  
  name     = "gke-policy-cluster"
  location = "AU"

  dns_config {
    cluster_dns                   = "PLATFORM_DEFAULT"     
    cluster_dns_scope             = "CLUSTER_SCOPE"       
    cluster_dns_domain            = "example.local"       
  }

  gateway_api_config {
    channel = "CHANNEL_DISABLED"  
  }
}
  
