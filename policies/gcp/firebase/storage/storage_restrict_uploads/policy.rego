package gcp.firebase.storage.owner_upload

# Deny if bucket object upload allows "allUsers" or "allAuthenticatedUsers"
deny[msg] if {
  some i
  bucket := input.resource_changes[i]
  bucket.type == "google_storage_bucket"
  perms := bucket.change.after.uniform_bucket_level_access

  not perms
  msg := sprintf("Bucket %v allows public uploads (uniform_bucket_level_access is disabled)", [bucket.change.after.name])
}

# Deny if IAM policy grants write access to public
deny[msg] if {
  some j
  binding := input.resource_changes[j]
  binding.type == "google_storage_bucket_iam_binding"
  after := binding.change.after
  after.role == "roles/storage.objectCreator"
  after.members[_] == "allUsers"
  msg := sprintf("Bucket %v allows public uploads via IAM role", [after.bucket])
}
