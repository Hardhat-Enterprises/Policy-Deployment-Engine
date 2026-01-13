resource "google_apigee_envgroup" "env_grp" {
  name      = "my-envgroup-nc"
  hostnames = ["test.com"]
  org_id    = "Test"
}