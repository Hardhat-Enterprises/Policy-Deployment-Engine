resource "google_os_config_os_policy_assignment" "compliant_example_1" {
  name     = "compliant-example-1"
  location = "australia-southeast1"

  instance_filter {
    all = true
  }

  os_policies {
    id   = "policy-1"
    mode = "ENFORCEMENT"

    resource_groups {
      resources {
        id = "resource-1"
        exec {
          validate {
            interpreter = "SHELL"
            script      = "exit 100"
          }
          enforce {
            interpreter = "SHELL"
            file {
              allow_insecure = true
              remote {
                uri             = "https://example.com/artifact.sh"
                sha256_checksum = "44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a"
              }
            }
          }
        }
      }
    }
  }

  rollout {
    disruption_budget {
      percent = 100
    }
    min_wait_duration = "60s"
  }
}
