resource "google_artifact_registry_repository" "compliant_example_1" {
  project                = "my-project-id"
  location               = "us-central1"
  repository_id          = "my-repository"
  description            = "example docker repository with cleanup policies"
  format                 = "DOCKER"
  cleanup_policy_dry_run = true
  cleanup_policies {
    id     = "delete-untagged"
    action = "DELETE"
    condition {
      tag_state = "UNTAGGED"
    }
  }

  cleanup_policies {
    id     = "keep-minimum-versions"
    action = "KEEP"
    most_recent_versions {
      package_name_prefixes = ["webapp", "mobile", "sandbox"]
      keep_count            = 5
    }
  }
}
