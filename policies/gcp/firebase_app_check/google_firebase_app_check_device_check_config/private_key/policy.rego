package terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.private_key

# Security Control: Enforce Secret Manager for DeviceCheck private_key.
#
# Hardcoding private keys in Terraform increases the risk of credential exposure.
# By enforcing the use of Secret Manager resource references (projects/*/secrets/*),
# we ensure secrets are protected and centrally managed.
#
# Reference: https://firebase.google.com/docs/app-check/ios/devicecheck-provider

# Count total resources
total_count := count([r | r := input.planned_values.root_module.resources[_]; r.type == "google_firebase_app_check_device_check_config"])

# Collect non-compliant resource names
non_compliant := [name |
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_firebase_app_check_device_check_config"
    private_key := resource.values.private_key
    not regex.match("^projects/.+/secrets/.+", private_key)
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
    private_key := resource.values.private_key
    not regex.match("^projects/.+/secrets/.+", private_key)
    name := object.get(resource, "name", resource.address)
    msg := sprintf(
        "Firebase DeviceCheck Config '%s' has private_key that is not a valid Secret Manager secret reference (projects/*/secrets/*). Secrets should not be hardcoded.",
        [name]
    )
}