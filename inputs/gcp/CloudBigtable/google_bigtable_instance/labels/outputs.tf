output "folder_c" {
  description = "The folder ID where the IAM audit configuration was applied for folder C."
  value       = module.folder_c.audit_config.folder
}

output "folder_nc" {
  description = "The folder ID where the IAM audit configuration was applied for folder NC."
  value       = module.folder_nc.audit_config.folder
}
