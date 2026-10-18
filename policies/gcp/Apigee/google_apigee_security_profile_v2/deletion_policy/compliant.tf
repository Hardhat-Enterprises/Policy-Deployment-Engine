resource "google_apigee_security_profile_v2" "compliant_example_1" {
  org_id          = "organizations/PDE-Apigee-Project"
  profile_id      = "example-security-profile"
  deletion_policy = "PREVENT"

  profile_assessment_configs {
    assessment = "auth-policies-check"
    weight     = "MODERATE"
  }
}
