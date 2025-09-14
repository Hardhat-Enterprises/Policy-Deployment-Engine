# Compliant Firestore ruleset requiring authentication
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firestore_ruleset" "c" {
  project = "example-project"
  source {
    files {
      name    = "firestore.rules"
      content = <<EOT
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
EOT
    }
  }
}
