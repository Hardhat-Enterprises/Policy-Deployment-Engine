terraform {
  required_providers {
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

provider "google-beta" {
  project = "dummy-project"
  region  = "us-central1"

  credentials = <<EOT
{
  "type": "service_account",
  "project_id": "dummy-project",
  "private_key_id": "dummy",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASC\n-----END PRIVATE KEY-----\n",
  "client_email": "dummy@dummy-project.iam.gserviceaccount.com",
  "client_id": "123456789",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/dummy"
}
EOT
}