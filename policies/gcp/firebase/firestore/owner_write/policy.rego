package gcp.firebase.firestore.owner_write

import rego.v1

# Deny if a write is not performed by the document owner
deny[msg] if {
    some change in input.resource_changes
    change.type == "google_firestore_document"
    after := change.change.after
    before := change.change.before

    # Check write operation
    after.fields.ownerId.string_value != input.resource_changes[change].change.after.fields.request.auth.uid
    msg := sprintf("Firestore write denied: request.auth.uid != ownerId for document %s", [after.name])
}
