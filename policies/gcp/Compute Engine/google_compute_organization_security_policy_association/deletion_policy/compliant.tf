resource "google_compute_organization_security_policy_association" "compliant_example_1" {
  name            = "compliant-example-1"
  attachment_id   = "organizations/123456789"
  policy_id       = "locations/global/securityPolicies/example-policy"
  deletion_policy = "PREVENT"
}
