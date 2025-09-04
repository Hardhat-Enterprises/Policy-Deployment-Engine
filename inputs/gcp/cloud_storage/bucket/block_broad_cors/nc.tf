resource "google_storage_bucket" "nc" {
name = "nc"
location ="EUROPE-WEST8"

cors {
  origin = ["*"]

}
}

resource "google_storage_bucket" "nc1" {
name = "nc1"
location ="EUROPE-WEST8"

cors {
  method = ["*"]

}
}