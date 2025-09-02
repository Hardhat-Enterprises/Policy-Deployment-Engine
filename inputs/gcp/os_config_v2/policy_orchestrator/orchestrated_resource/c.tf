resource "google_os_config_v2_policy_orchestrator" "c" {
    policy_orchestrator_id = "po"
    project = "121623553414"
    state = "ACTIVE"
    action = "UPSERT"

    orchestrated_resource {
        id = "test-orchestrated-resource"
        os_policy_assignment_v1_payload {
            os_policies {
                id = "test-os-policy"
                mode = "VALIDATION"
                resource_groups {
                    resources {
                        id = "Nmap"
                        repository {
                            apt {
                                uri = "ppa:nmap/nmap"
                                distribution = "focal"
                                components = ["main"]
                                archive_type = "DEB"
                            }
                        }
                    }
                }
            }
            instance_filter {
                inventories {
                    os_short_name = "Debian"
                }
            }
            rollout {
                disruption_budget {
                    percent = 100
                }
                min_wait_duration = "60s"
            }
        }
    }
    labels = {
        state = "active"
    }
}