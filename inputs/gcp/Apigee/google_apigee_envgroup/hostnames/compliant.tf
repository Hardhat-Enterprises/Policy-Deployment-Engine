resource "google_apigee_envgroup" "compliant_example_1" {
  name      = "compliant_example_1"
  hostnames = ["abc.foo.com"]
  org_id    = "organizations/pde-org"
}
