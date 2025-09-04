resource "google_storage_bucket_object" "nc" {
  name   = "nc"
  source = "/images/nature/garden-tiger-moth.jpg"
  bucket = "image-store-nc"

}