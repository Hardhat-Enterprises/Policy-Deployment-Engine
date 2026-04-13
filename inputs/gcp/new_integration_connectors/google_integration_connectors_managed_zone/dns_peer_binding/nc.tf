resource "google_project" "target_project_nc" {
  name       = "test"
  project_id = "pde"
}

resource "google_project_iam_member" "dns_peer_binding-nc" {
  project = "google_project.target_project.project_id"
  role    = "roles/dns.peer"
  member  = "serviceAccount:service-hacker@gcp-sa-connectors.iam.gserviceaccount.com"
}
