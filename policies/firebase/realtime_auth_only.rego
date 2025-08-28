package terraform.firebase.security.realtime_database.auth_only

# Define the compliance condition
conditions := [
  {
    "situation_description": "Realtime Database read/write must only be allowed for authenticated users.",
    "remedies": [
      "Update your Firebase Realtime Database rules to require request.auth != null"
    ],
    "condition": "request.auth != null",
    "policy_type": "custom"
  }
]

# Evaluate whether the user is authenticated
allow {
    input.auth != null
}

# Compute result string
result := "allowed" { allow }
result := "denied" { not allow }

# Build a message
message := sprintf(
    "Policy evaluation: principal %v access on %v is %v",
    [input.principal, input.resource.path, result]
)

# Details with condition and remedies
details := {
    "condition": conditions[0].condition,
    "remedies": conditions[0].remedies,
    "result": result
}
