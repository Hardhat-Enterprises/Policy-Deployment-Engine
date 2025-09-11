resource "google_storage_bucket" "nc123" {
  name                     = "nc123"
  location                 = "AU"
  public_access_prevention = "inherited"
}