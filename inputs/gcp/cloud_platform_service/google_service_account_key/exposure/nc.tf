resource "google_service_account_key" "nc1" {
  service_account_id = "projects/my-project/serviceAccounts/my-sa@my-project.iam.gserviceaccount.com"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"  
  key_algorithm      = "KEY_ALG_RSA_1024"              # ❌ insecure key
}
