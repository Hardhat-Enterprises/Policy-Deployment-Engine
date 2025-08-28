package terraform.firebase.security.storage.restrict_uploads

# Define the compliance condition
conditions := [
  {
    "situation_description": "Only authenticated users may upload images to Firebase Storage.",
    "remedies": [
      "Update Firebase Storage rules to require authentication and validate content-type (images only)"
    ],
    "condition": "request.auth != null && request.resource.contentType.matches('image/.*')",
    "policy_type": "custom"
  }
]

# Evaluate whether the upload is allowed
allow {
    input.auth != null
    re_match("^image/.*", input.resource.contentType)
}

# Compute result string
result := "allowed" { allow }
result := "denied" { not allow }

# Build a message
message := sprintf(
    "Policy evaluation: principal %v upload with contentType %v is %v",
    [input.principal, input.resource.contentType, result]
)

# Details with condition and remedies
details := {
    "condition": conditions[0].condition,
    "remedies": conditions[0].remedies,
    "result": result
}
