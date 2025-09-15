

resource "null_resource" "nc" {
  triggers = {
    resource_type      = "google_firebase_web_app_config"
    resource_value_name = "auth_domain"
    auth_domain        = "reas-bd5ca.example.com"
  }
}
