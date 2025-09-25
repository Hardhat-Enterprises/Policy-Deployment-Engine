resource "google_edgecontainer_cluster" "c" {
  name     = "c" #Required
  location = "australia-southeast1" #Required

  #Policy to be tested 
  maintenance_policy {
    window {
      recurring_window {
        window {
          start_time = "2023-01-01T09:00:00Z"
          end_time   = "2023-01-01T17:00:00Z"
        }
        recurrence = "FREQ=WEEKLY;BYDAY=SA"
      }
    }
  }
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
}
