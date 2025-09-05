resource "google_chronicle_rule" "c" {
  project  = "fake-project-123"  
  location = "us"
  instance = "scope-c"
  scope    = "projects/fake-project-123/us/scope-c/legitimatescope"
}

