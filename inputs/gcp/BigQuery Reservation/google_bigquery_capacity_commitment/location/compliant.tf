resource "google_bigquery_capacity_commitment" "compliant_example_1" {
  capacity_commitment_id = "compliant_example_1"
  location               = "australia-southeast1"
  slot_count             = 100
  plan                   = "FLEX_FLAT_RATE"
  edition                = "ENTERPRISE"
}
