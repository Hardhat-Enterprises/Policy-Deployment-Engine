resource "google_secret_manager_secret" "non_compliant_secret" {
  secret_id     = "test-secret"
  project = "PDE-connectors"
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret-version-non_compliant" {
  secret = google_secret_manager_secret.non_compliant_secret.id
  secret_data = "dummypassword"
}

resource "google_secret_manager_secret_iam_member" "secret_admin_non_compliant" {
  secret_id  = google_secret_manager_secret.non_compliant_secret.id
  role       = "roles/secretmanager.admin"
  member     = "serviceAccount:compute@user.gserviceaccount.com"
  depends_on = [google_secret_manager_secret_version.secret-version-non_compliant]
}