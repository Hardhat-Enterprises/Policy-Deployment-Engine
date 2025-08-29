package gcp.firebase.firestore.owner_write.vars

# Which resource types this policy applies to
resource_types = ["google_firestore_document"]

# Severity for PDE reporting
severity = "high"

# Human-readable metadata
metadata = {
  "id": "FIRESTORE_OWNER_ONLY_WRITES",
  "title": "Firestore Owner-only Write Enforcement",
  "description": "Ensures that Firestore documents can only be written by their owner (request.auth.uid == resource.ownerId).",
  "service": "Firestore",
  "provider": "gcp"
}
