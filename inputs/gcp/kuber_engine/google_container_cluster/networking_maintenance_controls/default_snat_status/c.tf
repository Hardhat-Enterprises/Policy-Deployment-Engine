# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_container_cluster" "c" {
    name     = "compliant-snat"
    location = "us-central1"
  
 
    default_snat_status {
      disabled = true
    }
  
  }
  