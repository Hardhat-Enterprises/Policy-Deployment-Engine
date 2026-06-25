resource "google_storage_folder" "non_compliant_example_1" {
  bucket        = "non_compliant_example_1"
  name          = "parent-folders/"
  force_destroy = true
}

