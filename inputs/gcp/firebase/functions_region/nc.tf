# Non-compliant Firebase Function deployed in disallowed region
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "null_resource" "nc" {
  triggers = {
    name   = "disallowed-function"
    region = "asia-south1"
    runtime = "nodejs18"
    type   = "google_cloudfunctions_function"
  }
}

