resource "google_project" "target_project" {
  name            = "test"
  project_id      = "pde"
}

resource "google_project_iam_member" "dns_peer_binding" {
  project = google_project.target_project.project_id
  role    = "roles/dns.peer"
  member  = "serviceAccount:service-@gcp-sa-connectors.iam.gserviceaccount.com"
}


