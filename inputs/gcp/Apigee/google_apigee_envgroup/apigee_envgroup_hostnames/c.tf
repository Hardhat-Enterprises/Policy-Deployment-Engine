resource "google_apigee_envgroup" "c" {
  name      = "c"
  hostnames = ["abc.foo.com"]
  org_id    = "organizations/pde-org"
}