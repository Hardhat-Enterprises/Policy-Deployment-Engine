# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_active_directory_peering" "c" {
  provider           = google-beta
  domain_resource    = "projects/secure-prod-project/locations/global/domains/pde.org.com"
  peering_id         = "ad-peering-c"
  authorized_network = "projects/secure-prod-project/global/networks/ad-network"
  
  project            = "secure-project"
}



