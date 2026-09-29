resource "google_os_config_v2_policy_orchestrator" "non_compliant_example_1" {
    policy_orchestrator_id = "non-compliant-example-1"
    project = "121623553414"
    state = "STOPPED"
    action = "UPSERT"

    orchestrated_resource {
        id = "test-orchestrated-resource"

        os_policy_assignment_v1_payload {
            os_policies {
                id = "test-os-policy"
                mode = "VALIDATION"

                resource_groups {
                    resources {
                        id = "resource-tf"

                        file {
                            path = "/tmp/managed.conf"
                            state = "PRESENT"
                            file {
                                remote {
                                    uri = "http://example.com/source.conf"
                                    sha256_checksum = "abc123"
                                }
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
}