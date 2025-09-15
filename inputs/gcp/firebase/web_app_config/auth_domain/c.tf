

resource "null_resource" "compliant_app" {
  triggers = {
    resource_type      = "google_firebase_web_app_config"
    resource_value_name = "auth_domain"
    auth_domain        = "ankita-firebase-web-app.firebaseapp.com"
  }
}