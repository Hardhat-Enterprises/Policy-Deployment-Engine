resource "google_apigee_envgroup" "c" {
  name      = "my-envgroup-c"
  hostnames = ["hardht.deakin.edu.au"]
  org_id    = "PDE-Apigee-Org"
}