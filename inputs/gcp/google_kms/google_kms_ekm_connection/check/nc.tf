
# 1 Bad region
resource "google_kms_ekm_connection" "nc1" {
  name                = "nc1"
  location            = "asia-east1" # ← not whitelisted
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/namespace_name/services/service_name"
    hostname                  = "example-ekm.goog"
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}

# 2 Bad hostname
resource "google_kms_ekm_connection" "nc2" {
  name                = "nc2"
  location            = "us-central1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/namespace_name/services/service_name"
    hostname                  = "malicious.example.com" # ← not on your whitelist
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}

# 3 Bad service_directory_service
resource "google_kms_ekm_connection" "nc3" {
  name                = "nc3"
  location            = "us-central1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/other-project/locations/us-central1/namespaces/namespace_name/services/service_name"
    # ← points at an unapproved project
    hostname = "example-ekm.goog"
    server_certificates {
      raw_der = "==HAwIBCCAr6gAwIBAgIUWR+EV4lqiV7Ql12VY=="
    }
  }
}