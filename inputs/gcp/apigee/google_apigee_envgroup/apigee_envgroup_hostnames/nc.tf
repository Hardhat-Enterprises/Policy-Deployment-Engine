resource "google_apigee_envgroup" "nc" {
  name      = "nc"
  hostnames = []
  org_id    = "organizations/pde-org"
}