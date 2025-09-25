resource "google_storage_bucket_object" "c123" {
  name         = "c123"
  source       = "/images/nature/garden-tiger-moth.jpg"
  bucket       = "image-store"
  kms_key_name = "abc"
}