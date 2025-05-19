

# 1 Bad region
resource "google_kms_ekm_connection" "bad_location" {
  name                 = "ekm_bad_loc"
  location             = "asia-east1"   # ← not whitelisted
  key_management_mode  = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/namespace_name/services/service_name"
    hostname                  = "example-ekm.goog"
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}

# 2 Bad hostname
resource "google_kms_ekm_connection" "bad_hostname" {
  name                 = "ekm_bad_host"
  location             = "us-central1"
  key_management_mode  = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/namespace_name/services/service_name"
    hostname                  = "malicious.example.com"  # ← not on your whitelist
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}

# 3 Bad service_directory_service
resource "google_kms_ekm_connection" "bad_svcdir" {
  name                 = "ekm_bad_svcdir"
  location             = "us-central1"
  key_management_mode  = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/other-project/locations/us-central1/namespaces/namespace_name/services/service_name"
                                        # ← points at an unapproved project
    hostname                  = "example-ekm.goog"
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}