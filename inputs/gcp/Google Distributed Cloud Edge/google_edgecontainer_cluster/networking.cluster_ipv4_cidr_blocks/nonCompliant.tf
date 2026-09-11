resource "google_edgecontainer_cluster" "non_compliant_example_1" {
  name     = "non_compliant_example_1" #Required
  location = "australia-southeast1" #Required
  
  networking {
    #overly permissive CIDR ranges
    cluster_ipv4_cidr_blocks  = ["0.0.0.0/0"]
    services_ipv4_cidr_blocks = ["0.0.0.0/0"]
  } #Policy to be tested 
 
  authorization {
    admin_users {
      username = "hpandya368@gmail.com"
    }
  }

  fleet {
   project = "projects/gdce-dev"
} #Required
}
