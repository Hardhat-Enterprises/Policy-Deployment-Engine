resource "google_iam_workforce_pool" "c" {
  workforce_pool_id = "valid-pool-123"
  parent            = "organizations/123456789"
  location          = "global"
}