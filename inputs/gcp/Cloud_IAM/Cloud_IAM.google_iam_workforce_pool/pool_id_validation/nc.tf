resource "google_iam_workforce_pool" "nc" {
  workforce_pool_id = "invalid-pool-123"
  parent            = "organizations/123456789"
  location          = "global"
}