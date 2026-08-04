package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.patching_mode

deny[msg] {
    input.resource.properties.maintenance_window.patching_mode == "NON_ROLLING"
    msg := "Patching mode must be ROLLING to maintain resilience."
}
