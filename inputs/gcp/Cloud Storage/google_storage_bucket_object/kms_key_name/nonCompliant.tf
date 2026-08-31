resource "google_storage_bucket_object" "non_compliant_example_1" {
  name   = "non_compliant_example_1"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket       = "image-store"

}
