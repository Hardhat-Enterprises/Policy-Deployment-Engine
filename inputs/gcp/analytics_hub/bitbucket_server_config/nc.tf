resource "google_cloudbuild_bitbucket_server_config" "nc" {
  config_id = "Bad_Config"         # ❌ Invalid naming convention
  location  = "europe-west1"       # ❌ Not allowed location
  host_uri  = "http://insecure.com" # ❌ Should use https

  secrets {
    admin_access_token_version_name = ""
    read_access_token_version_name  = ""
    webhook_secret_version_name     = ""
  }

  username = "admin"
  api_key  = "short"               # ❌ Insecure api_key
}
