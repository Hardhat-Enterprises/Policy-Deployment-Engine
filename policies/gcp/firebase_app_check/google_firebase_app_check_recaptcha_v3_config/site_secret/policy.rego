package terraform.gcp.security.firebase_app_check.google_firebase_app_check_recaptcha_v3_config.site_secret

# Security Control: Enforce Secret Manager for reCAPTCHA v3 site_secret.
#
# Hardcoding reCAPTCHA site secrets in Terraform increases the risk of
# credential exposure. By enforcing the use of Secret Manager resource
# references (projects/*/secrets/*), we ensure secrets are protected
# and centrally managed.
#
# Reference: https://firebase.google.com/docs/app-check/web/recaptcha-v3

# Count total resources
total_count := count([r | r := input.planned_values.root_module.resources[_]; r.type == "google_firebase_app_check_recaptcha_v3_config"])

# Collect non-compliant resource names
non_compliant := [name |
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_firebase_app_check_recaptcha_v3_config"
    site_secret := resource.values.site_secret
    not regex.match("^projects/.+/secrets/.+", site_secret)
    name := object.get(resource, "name", resource.address)
]

# Generate message output for test framework
message := [
    sprintf("Total Firebase App Check reCAPTCHA v3 Config detected: %d ", [total_count]),
    concat(", ", non_compliant)
] if {
    count(non_compliant) > 0
} else := [
    sprintf("Total Firebase App Check reCAPTCHA v3 Config detected: %d ", [total_count])
]

deny contains msg if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_firebase_app_check_recaptcha_v3_config"
    site_secret := resource.values.site_secret
    not regex.match("^projects/.+/secrets/.+", site_secret)
    name := object.get(resource, "name", resource.address)
    msg := sprintf(
        "Firebase reCAPTCHA v3 Config '%s' has site_secret '%s', which is not a valid Secret Manager secret reference (projects/*/secrets/*). Secrets should not be hardcoded.",
        [name, site_secret]
    )
}
