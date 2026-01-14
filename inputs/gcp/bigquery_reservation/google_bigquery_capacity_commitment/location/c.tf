resource "google_bigquery_capacity_commitment" "c" {
  capacity_commitment_id = "c-commitment"
  location               = "US"
  slot_count             = 100
  plan                   = "FLEX_FLAT_RATE"
  edition                = "ENTERPRISE"
}
