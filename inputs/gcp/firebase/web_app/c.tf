# Compliant Firebase Storage bucket restricted to project members
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "null_resource" "c" {
  triggers = {
    resource_type = "google_storage_bucket"
    name          = "restricted-bucket-example"
    location      = "US"
    uniform_acl   = true
  }
}
