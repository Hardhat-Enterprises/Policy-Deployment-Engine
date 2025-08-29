package gcp.firebase.auth.token_expiry

# Deny when no session cookie TTL is defined
deny[msg] if {
    some r
    resource := input.resource_changes[r]
    resource.type == "google_identity_platform_tenant"

    not resource.change.after.session_cookie_config
    msg := sprintf("Firebase Auth tenant %v does not have token expiry configured", [resource.name])
}

# Deny when TTL exists but is empty
deny[msg] if {
    some r
    resource := input.resource_changes[r]
    resource.type == "google_identity_platform_tenant"

    resource.change.after.session_cookie_config.ttl == ""
    msg := sprintf("Firebase Auth tenant %v has empty token expiry TTL", [resource.name])
}
