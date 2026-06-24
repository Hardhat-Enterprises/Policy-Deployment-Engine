resource "google_storage_bucket" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "EUROPE-WEST8"

  cors {
    origin = ["*"]

  }
}

resource "google_storage_bucket" "non_compliant_example_2" {
  name     = "non_compliant_example_2"
  location = "EUROPE-WEST8"

  cors {
    method = ["*"]

  }
}
