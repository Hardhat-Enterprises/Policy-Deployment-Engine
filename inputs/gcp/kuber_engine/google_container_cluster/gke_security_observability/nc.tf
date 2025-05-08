# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
    name     = "insecure-cluster"
  
    binary_authorization {
      evaluation_mode = "DISABLED"
    }
  
    workload_identity_config {
      workload_pool = "my-project.svc.id.goog"
    }
  
    logging_config {
      enable_components = ["SYSTEM_COMPONENTS"]
    }
  
    monitoring_config {
      enable_components = ["WORKLOADS", "POD"] 
    }
  }
  