resource "google_storage_managed_folder" "non_compliant_example_1" {
  bucket        = "non_compliant_example_1"
  name          = "managed/folder/name/"
  force_destroy = true
}
