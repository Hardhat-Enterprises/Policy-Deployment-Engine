# Non-compliant Firestore ruleset allowing open access
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_firestore_ruleset" "nc" {
  project = "example-project"
  source {
    files {
      name    = "firestore.rules"
      content = <<EOT
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
EOT
    }
  }
}
