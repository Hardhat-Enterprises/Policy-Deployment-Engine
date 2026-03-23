package terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.token_ttl

# Security Control: Enforce a maximum token_ttl of 86400s (24 hours).
#
# App Check tokens issued by DeviceCheck are bearer tokens. If intercepted,
# a token remains usable for its entire TTL — this is the replay attack window.
# Firebase allows TTLs up to 604800s (7 days), which gives an attacker up to
# 7 days to exploit a stolen token. Capping at 86400s (24h) limits that window
# to an operationally acceptable but security-bounded duration.
#
# Reference: https://firebase.google.com/docs/app-check/token-ttl

max_ttl_seconds := 86400

# Count total resources
total_count := count([r | r := input.planned_values.root_module.resources[_]; r.type == "google_firebase_app_check_device_check_config"])

# Collect non-compliant resource names
non_compliant := [name |
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_firebase_app_check_device_check_config"
    ttl_str := resource.values.token_ttl
    ttl_str  # ensure token_ttl exists
    ttl_seconds := to_number(replace(ttl_str, "s", ""))
    ttl_seconds > max_ttl_seconds
    name := object.get(resource, "name", resource.address)
]

# Generate message output for test framework
message := [
    sprintf("Total Firebase App Check DeviceCheck Config detected: %d ", [total_count]),
    concat(", ", non_compliant)
] if {
    count(non_compliant) > 0
} else := [
    sprintf("Total Firebase App Check DeviceCheck Config detected: %d ", [total_count])
]

deny contains msg if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_firebase_app_check_device_check_config"
    ttl_str := resource.values.token_ttl
    ttl_seconds := to_number(replace(ttl_str, "s", ""))
    ttl_seconds > max_ttl_seconds
    name := object.get(resource, "name", resource.address)
    msg := sprintf(
        "Firebase DeviceCheck Config '%s' has token_ttl '%s' (%ds), which exceeds the maximum permitted 86400s (24h). Tokens with excessive TTL widen the replay attack window if intercepted.",
        [name, ttl_str, ttl_seconds]
    )
}
