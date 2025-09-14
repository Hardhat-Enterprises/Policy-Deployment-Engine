# Non-compliant Firebase Function deployed in disallowed region
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_cloudfunctions_function" "nc" {
  name   = "disallowed-function"
  region = "asia-south1"
  runtime = "nodejs18"
}
