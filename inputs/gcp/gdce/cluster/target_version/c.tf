resource "google_edgecontainer_cluster" "c" {
  name     = "c" #Required
  location = "australia-southeast1"  #Required
 
  networking {
    cluster_ipv4_cidr_blocks  = ["10.0.0.0/16"]
    services_ipv4_cidr_blocks = ["10.1.0.0/16"]
  } #Required

  authorization {
    admin_users {
      username = "hpandya368@gmail.com"
    }
  } #Required

 fleet {
  project = "projects/gdce-dev"
} #Required

  target_version = "1.5.0" #Policy to be tested 
}
