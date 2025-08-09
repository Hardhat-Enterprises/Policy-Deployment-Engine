resource "google_storage_bucket" "nc" {
name = "gcp-test-bucket-nc1"
location ="EUROPE-WEST8"

cors {
  origin = ["*"]

}
}

resource "google_storage_bucket" "nc2" {
name = "gcp-test-bucket-nc2"
location ="EUROPE-WEST8"

cors {
  method = ["*"]

}
}