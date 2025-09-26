resource "google_iap_web_iam_member" "c" {
  project = "c"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "user:jane@example.com"

  condition {
    title       = "hosts_corp_only"
    description = "Allow only corporate hostnames"
    expression  = "request.host.startsWith(\"corp.example.com\")"
  }
}
