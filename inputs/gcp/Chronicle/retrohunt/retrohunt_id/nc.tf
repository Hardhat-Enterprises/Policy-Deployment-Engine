# Empty retrohunt ID
resource "google_chronicle_retrohunt" "empty_retrohunt_id" {
  project    = "fake-test-project"
  location   = "us"
  instance   = "00000000-0000-0000-0000-000000000000"
  rule       = "example-rule"
  retrohunt  = ""
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T12:00:00Z"
  }
}

# Invalid UUID format
resource "google_chronicle_retrohunt" "invalid_format_retrohunt_id" {
  project    = "fake-test-project"
  location   = "us"
  instance   = "00000000-0000-0000-0000-000000000000"
  rule       = "example-rule"
  retrohunt  = "not-a-valid-id"
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T12:00:00Z"
  }
}

# Valid UUID format but not in whitelist
resource "google_chronicle_retrohunt" "not_whitelisted_retrohunt_id" {
  project    = "fake-test-project"
  location   = "us"
  instance   = "00000000-0000-0000-0000-000000000000"
  rule       = "example-rule"
  retrohunt  = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T12:00:00Z"
  }
}
