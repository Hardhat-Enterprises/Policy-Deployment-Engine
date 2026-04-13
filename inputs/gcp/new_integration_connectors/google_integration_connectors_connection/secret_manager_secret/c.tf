resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "test-secret"
  project   = "PDE-connectors"
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret      = google_secret_manager_secret.secret-basic.id
  secret_data = "dummypassword"
}

resource "google_secret_manager_secret_iam_member" "secret_iam" {
  secret_id  = google_secret_manager_secret.secret-basic.id
  role       = "roles/secretmanager.admin"
  member     = "serviceAccount:compute@developer.gserviceaccount.com"
  depends_on = [google_secret_manager_secret_version.secret-version-basic]
}


