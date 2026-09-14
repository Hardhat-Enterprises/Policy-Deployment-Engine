resource "google_compute_backend_bucket" "compliant_example_1" {
  name        = "compliant-example-1"
  bucket_name = "compliant-example-bucket"

  params {
    resource_manager_tags = {
      "tagKeys/123456789" = "tagValues/987654321"
    }
  }
}