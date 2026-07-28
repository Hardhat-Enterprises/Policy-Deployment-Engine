resource "google_database_migration_service_private_connection" "compliant_example_1" {
    display_name          = "compliant_example_1"
    location              = "australia-southeast2"
    private_connection_id = "my-connection"
    project               = "gcp-project-id"

    vpc_peering_config {
        vpc_name = "projects/my-gcp-project-id/global/networks/my-network"
        subnet = "10.0.0.0/29"
    }

    create_without_validation = false
}

