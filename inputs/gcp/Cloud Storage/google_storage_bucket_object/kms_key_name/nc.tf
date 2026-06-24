resource "google_storage_bucket_object" "nc123" {
  name   = "nc123"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store-nc"

}