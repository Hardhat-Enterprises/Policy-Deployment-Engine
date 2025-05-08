# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_cluster" "nc" {
  name     = "secure-cluster"
  location = "us-central1"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

  default_snat_status {
    disabled = true
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = ""
    services_ipv4_cidr_block = ""
  }


  vertical_pod_autoscaling {
    enabled = false
  }
}
