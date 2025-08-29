package gcp.firebase.auth.token_expiry

default severity = "high"
default description = "Firebase Auth tenants must configure token expiry (session cookie TTL)."
default remediation = "Set session_cookie_config.ttl in the google_identity_platform_tenant resource."
