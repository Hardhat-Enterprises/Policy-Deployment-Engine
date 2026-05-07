resource "google_workflows_workflow" "nc" {
  name          = "nc"
  project       = "pde"
  region        = "us-central1"
  description   = "description"
  crypto_key_name = "projects/pde/locations/us-central1/keyRings/keyRing/cryptoKeys/cryptoKey"
  labels = {
    env = "test"
  }
  source_contents = <<-EOF
  
  - getCurrentTime:
      call: http.get
      args:
          url: $${sys.get_env("url")}
      result: currentTime
EOF
}
