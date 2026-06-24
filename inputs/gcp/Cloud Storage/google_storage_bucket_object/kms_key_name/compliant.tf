resource "google_storage_bucket_object" "compliant_example_1" {
  name         = "compliant_example_1"
  source       = "/images/nature/garden-tiger-moth.jpg"
  bucket       = "image-store"
  kms_key_name = "abc"
}
