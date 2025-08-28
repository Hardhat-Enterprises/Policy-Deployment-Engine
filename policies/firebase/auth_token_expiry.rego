package terraform.firebase.security.auth.token_expiry

# Define the compliance condition
conditions := [
  {
    "situation_description": "Firebase access tokens must expire within 1 hour.",
    "remedies": [
      "Ensure tokens issued via Firebase Auth have exp <= 3600 seconds"
    ],
    "condition": "request.auth.token.exp <= 3600",
    "policy_type": "custom"
  }
]

# Evaluate whether the token is valid
allow {
    input.auth.token.exp <= 3600
}

# Compute result string
result := "allowed" { allow }
result := "denied" { not allow }

# Build a message
message := sprintf(
    "Policy evaluation: token with exp %v seconds is %v",
    [input.auth.token.exp, result]
)

# Details with condition and remedies
details := {
    "condition": conditions[0].condition,
    "remedies": conditions[0].remedies,
    "result": result
}
