package hardhat.gcp.oracle_database.cloud_exadata_infrastructure.deletion_policy

deny[msg] {
    input.resource.deletion_policy == "DELETE"
    msg := "Deletion policy must not be DELETE for critical Exadata infrastructure."
}
