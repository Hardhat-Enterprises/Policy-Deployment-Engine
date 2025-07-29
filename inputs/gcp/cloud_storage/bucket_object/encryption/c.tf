resource "google_storage_bucket_object" "c" {
  name   = "butterfly01-c"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store"
  kms_key_name = "abc"
}