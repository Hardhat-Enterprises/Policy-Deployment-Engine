resource "google_service_account" "custom_service_account" {
  account_id   = "my-account-c"
  display_name = "Custom Service Account"
  project      = "appeng-flex"
}

resource "google_storage_bucket" "bucket" {
  name     = "hardhat-standard-static-content"
  location = "US"
  project  = "appeng-flex"
}

resource "google_storage_bucket_object" "object" {
  name   = "hello-world.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./test-fixtures/hello-world.zip"
}

resource "google_app_engine_standard_app_version" "c" {
  version_id = "v1"
  project    = "appeng-flex"
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "storage.googleapis.com{google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  service_account = "google_service_account.custom_service_account.email"
}