resource "google_edgecontainer_cluster" "non_compliant_example_1" {
  name     = "non_compliant_example_1" #Required
  location = "australia-southeast1" #Required

  networking {
    cluster_ipv4_cidr_blocks  = ["10.0.0.0/16"]
    services_ipv4_cidr_blocks = ["10.1.0.0/16"]
  } #Required
 
  authorization {
    admin_users {
      username = "hpandya368@gmail.com"
    }
  }

  fleet {
   project = "projects/gdce-dev"
} #Required

  #outdated version
  target_version = "1.0.0" #Policy to be tested 
}
