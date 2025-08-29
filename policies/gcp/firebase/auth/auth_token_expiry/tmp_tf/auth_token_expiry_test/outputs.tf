output "tenant_id" {
  description = "ID of the Firebase Auth tenant"
  value       = google_identity_platform_tenant.test_tenant_no_expiry.name
}
