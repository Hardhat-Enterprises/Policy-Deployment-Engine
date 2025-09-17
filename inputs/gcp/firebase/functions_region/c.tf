# Compliant Firebase Function deployed in approved region
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "null_resource" "c" {
  triggers = {
    name   = "approved-function"
    region = "us-central1"
    runtime = "nodejs18"
    type   = "google_cloudfunctions_function"
  }
}
