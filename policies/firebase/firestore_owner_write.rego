package terraform.firebase.security.firestore.collection_owner_write

# Define the compliance conditions
conditions := [
  {
    "situation_description": "Firestore write must only be allowed by the document owner.",
    "remedies": [
      "Update your Firebase security rules to require: request.auth.uid == resource.data.ownerId"
    ],
    "condition": "input.method == \"write\" implies input.auth.uid == input.resource.data.ownerId",
    "policy_type": "custom"
  }
]

# Evaluate whether the write is allowed
allow {
    input.method != "write"
}

allow {
    input.method == "write"
    input.auth.uid == input.resource.data.ownerId
}

# Compute the result string
result := "allowed" { allow }
result := "denied" { not allow }

# Build the message
message := sprintf(
    "Policy evaluation: write by %v on document owned by %v is %v",
    [input.auth.uid, input.resource.data.ownerId, result]
)

# Details with condition and remedies
details := {
    "condition": conditions[0].condition,
    "remedies": conditions[0].remedies,
    "result": result
}