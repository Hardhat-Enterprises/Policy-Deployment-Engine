# Compliant Realtime Database rules requiring authentication
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_database_instance" "c" {
  name = "restricted-db"
  rules = <<EOT
{
  ".read": "auth != null",
  ".write": "auth != null"
}
EOT
}

