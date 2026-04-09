resource "google_firebase_hosting_version" "c" {
  provider = google-beta
  site_id  = "c"

  config {
    rewrites {
      glob = "/app/**"
      path = "/index.html"
    }
  }
}
