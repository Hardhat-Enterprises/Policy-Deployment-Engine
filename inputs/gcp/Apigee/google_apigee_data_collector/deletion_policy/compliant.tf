resource "google_apigee_data_collector" "compliant_example_1" {
  org_id            = "organizations/PDE-Apigee-Project"
  data_collector_id = "dc_compliant_test"
  type              = "STRING"
  description       = "Compliant example"
  deletion_policy   = "PREVENT"
}
