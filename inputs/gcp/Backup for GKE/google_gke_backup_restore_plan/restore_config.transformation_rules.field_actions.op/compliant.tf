resource "google_gke_backup_restore_plan" "compliant_example_1" {
  name                = "c"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    transformation_rules {
      description = "Remove service accounts"
      field_actions {
        op   = "REMOVE"
        path = "/spec/serviceAccountName"
      }
    }
    
    transformation_rules {
      description = "Remove secrets"
      field_actions {
        op   = "REMOVE"
        path = "/spec/containers[]/env[]/valueFrom/secretKeyRef"
      }
    }
    
    transformation_rules {
      description = "Remove privileged mode"
      field_actions {
        op    = "REPLACE"
        path  = "/spec/containers[]/securityContext/privileged"
        value = "false"
      }
    }
  }
}

resource "google_gke_backup_restore_plan" "compliant_example_2" {
  name                = "c"
  location    = "australia-southeast1"
  project     = "PDE"
  backup_plan        = "c"
  cluster     = "projects/PDE/locations/australia-southeast1/clusters/c"
  
  restore_config {
    selected_namespaces {
      namespaces = ["production"]
    }
    
    transformation_rules {
      description = "Remove sensitive fields"
      field_actions {
        op = "REMOVE"
        path = "/spec/serviceAccountName"
      }
    }
    
    transformation_rules {
      description = "Remove privileged security context"
      field_actions {
        op = "REMOVE"
        path = "/spec/containers[]/securityContext/privileged"
      }
    }
  }
}
