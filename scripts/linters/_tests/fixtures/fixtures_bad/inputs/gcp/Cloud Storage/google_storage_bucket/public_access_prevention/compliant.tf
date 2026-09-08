resource "google_storage_bucket" "compliant_example_1" {
  name                     = "compliant_example_1"
  location                 = "AU"
  storage_class            = "STANDARD"
  public_access_prevention = "enforced"
}
