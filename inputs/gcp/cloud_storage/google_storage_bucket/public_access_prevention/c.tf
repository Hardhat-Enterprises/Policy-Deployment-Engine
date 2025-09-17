resource "google_storage_bucket" "c123" {
  name                     = "c123"
  location                 = "AU"
  public_access_prevention = "enforced"
}
