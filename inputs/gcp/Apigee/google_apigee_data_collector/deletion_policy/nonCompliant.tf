resource "google_apigee_data_collector" "non_compliant_example_1" {
  org_id            = "organizations/PDE-Apigee-Project"
  data_collector_id = "dc_noncompliant_test"
  type              = "STRING"
  description       = "Non-compliant example"
  deletion_policy   = "DELETE"
}
