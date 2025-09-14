# Compliant Realtime Database rules requiring authentication
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "null_resource" "c" {
  triggers = {
    resource_type = "google_firebase_database_instance"
    name          = "restricted-db"
    rules         = <<EOT
{
  ".read": "auth != null",
  ".write": "auth != null"
}
EOT
  }
}


