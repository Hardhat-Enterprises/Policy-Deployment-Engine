resource "google_project" "nc123" {
  name                = "nc123"
  project_id          = "proj-sec-test"
  org_id              = "123456789"
  auto_create_network = false
  deletion_policy     = "PREVENT"

  # ❌ either omit the tag entirely, or set an invalid value
  tags = {
    "tagKeys/env" = "tagValues/staging"  # not in dev/test/prod → will be flagged
  }
}
