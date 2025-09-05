terraform {
    required_providers {
        google = {
        source  = "hashicorp/google"
        version = "~> 6.0"
        }
        google-beta = {
        source  = "hashicorp/google-beta"
        version = "~> 6.0"
        }
    }
}
resource "google_project" "firebase_project" {
  name       = "Ankita Firebase Web App"
  project_id = "ankita-firebase-web-app"
}

resource "google_project_service" "firebase_api" {
  project = google_project.firebase_project.project_id
  service = "firebase.googleapis.com"
}