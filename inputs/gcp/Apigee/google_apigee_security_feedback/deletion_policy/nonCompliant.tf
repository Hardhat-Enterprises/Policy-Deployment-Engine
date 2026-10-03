resource "google_apigee_security_feedback" "non_compliant_example_1" {
  org_id          = "organizations/PDE-Apigee-Project"
  feedback_id     = "example-feedback"
  feedback_type   = "EXCLUDED_DETECTION"
  display_name    = "Example exclusion list"
  reason          = "PENETRATION_TEST"
  comment         = "Example exclusion"
  deletion_policy = "DELETE"

  feedback_contexts {
    attribute = "ATTRIBUTE_IP_ADDRESS_RANGES"
    values    = ["192.168.1.0/24"]
  }
}
