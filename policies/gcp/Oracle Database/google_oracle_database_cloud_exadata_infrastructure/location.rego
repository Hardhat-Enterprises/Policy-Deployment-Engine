package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.location

approved_locations := {"australia-southeast1", "australia-southeast2"}

deny[msg] {
    not approved_locations[input.resource.location]
    msg := sprintf("Location %s is not approved for Exadata deployment.", [input.resource.location])
}
