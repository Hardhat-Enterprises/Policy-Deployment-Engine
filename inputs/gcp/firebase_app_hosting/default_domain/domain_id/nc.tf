resource "google_firebase_app_hosting_default_domain" "nc" {
  project = "grounded-jetty-469512-j6"
  location = "australia-southeast1"
  backend = "non-compliant-backend"
  domain_id = "custom_domain@example.com"  # Non-compliant: Wrong format, contains invalid characters, wrong TLD
  
  disabled = false
}
