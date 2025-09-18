resource "google_gke_hub_membership_rbac_role_binding" "nc" {
  provider = google-beta
  project      = "example-project-123"
  membership_rbac_role_binding_id = "nc"
  membership_id = "basic"
  location      = "global"
  user          = "devops@example.com"

  role {
    predefined_role = "ADMIN"
  }
}
