resource "google_storage_bucket" "nc123" {
  name     = "nc123"
  location = "EUROPE-WEST8"

  cors {
    origin = ["*"]

  }
}

resource "google_storage_bucket" "nc1234" {
  name     = "nc1234"
  location = "EUROPE-WEST8"

  cors {
    method = ["*"]

  }
}