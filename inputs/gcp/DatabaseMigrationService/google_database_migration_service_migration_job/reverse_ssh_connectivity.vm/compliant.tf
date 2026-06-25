resource "google_database_migration_service_migration_job" "compliant_example_1" {
    display_name          = "compliant_example_1"
    location              = "australia-southeast2"
    migration_job_id  = "compliant-migration"
    project               = "gcp-project-id"
    type              = "ONE_TIME"
    
    reverse_ssh_connectivity {
        vm = "dummy-vm"
        vm_ip = "dummy-ip"
        vm_port = "123"
        vpc = "dummy-vpc"
    }
    
    source      = "projects/proj-id/locations/australia-southeast2/connectionProfiles/source"
    destination = "projects/proj-id/locations/australia-southeast2/connectionProfiles/destination"
}
