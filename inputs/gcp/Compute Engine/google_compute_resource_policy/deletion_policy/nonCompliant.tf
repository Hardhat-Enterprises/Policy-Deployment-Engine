resource "google_compute_resource_policy" "non_compliant-example-1" {
  name   = "non_compliant-example-1"
  region = "us-central1"
  deletion_policy = "DELETE"
}

resource "google_compute_resource_policy" "non_compliant-example-2" {
  name   = "non_compliant-example-2"
  region = "us-central1"
  deletion_policy = "ABANDON"
}