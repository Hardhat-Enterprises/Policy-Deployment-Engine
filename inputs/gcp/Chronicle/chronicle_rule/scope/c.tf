resource "google_chronicle_data_access_scope" "data_access_scope_test_c" {
  project              = "fake-project-123"  
  location             = "us"
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "scope-name"
  description          = "scope-description"
  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}

resource "google_chronicle_rule" "c" {
  project              = "fake-project-123"  
  location = "us"
  instance = "00000000-0000-0000-0000-000000000000"
  scope    = "projects/fake-project-123/locations/us/instances/00000000-0000-0000-0000-000000000000/dataAccessScopes/scope-name"

  text = <<-EOT
    rule test_rule {
      meta:
        author: "test-user"
      events:
        $userid = $e.principal.user.userid
      match:
        $userid over 10m
      condition:
        $e
    }
  EOT
}
