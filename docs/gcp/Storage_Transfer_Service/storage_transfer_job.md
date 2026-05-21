## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `transfer_spec` | Defines the source, sink, and transfer behavior for the Storage Transfer job. | true | true | The transfer specification controls what data is moved, from where, and under what restrictions. | A transfer_spec with an approved source, sink, and restricted transfer conditions. | A transfer_spec that omits restrictions or uses an unapproved source definition. |

### transfer_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcs_data_source` | Specifies a Google Cloud Storage bucket as the source for the transfer job. | false | true | The source bucket determines what data enters the transfer pipeline. It should reference only approved source locations. | gcs_data_source { bucket_name = "approved-source-bucket" } | gcs_data_source { bucket_name = "unapproved-public-bucket" } |
| `aws_s3_data_source` | Specifies an Amazon S3 bucket as the source for the transfer job. | false | true | Using an S3 source introduces external data into the transfer job and should be restricted to approved buckets and credentials. | aws_s3_data_source using an approved bucket and credential configuration. | aws_s3_data_source using an unapproved bucket or unmanaged credentials. |
| `azure_blob_storage_data_source` | Specifies an Azure Blob Storage container as the source for the transfer job. | false | true | Azure Blob source definitions should be limited to approved storage accounts and controlled credentials. | azure_blob_storage_data_source using an approved storage account and container. | azure_blob_storage_data_source using an unknown or unapproved storage account. |
| `http_data_source` | Specifies a list of HTTP or HTTPS URLs as the source for the transfer job. | false | true | HTTP-based sources can introduce integrity and confidentiality risks if insecure or untrusted endpoints are used. | http_data_source referencing approved HTTPS endpoints. | http_data_source referencing HTTP endpoints or untrusted URLs. |
| `posix_data_source` | Specifies a POSIX filesystem path as the source for the transfer job. | false | true | POSIX sources can expose local or attached filesystem data and should be limited to approved paths and agents. | posix_data_source { root_directory = "/approved/source/path" } | posix_data_source { root_directory = "/" } |
| `hdfs_data_source` | Specifies an HDFS path as the source for the transfer job. | false | true | HDFS sources should be controlled to prevent broad or unintended data extraction from distributed storage. | hdfs_data_source using an approved cluster and restricted root path. | hdfs_data_source using an unrestricted or unknown path. |
| `aws_s3_compatible_data_source` | Specifies an S3-compatible storage system as the source for the transfer job. | false | true | S3-compatible endpoints should be approved because they may point to third-party or self-hosted object storage. | aws_s3_compatible_data_source using an approved endpoint and bucket. | aws_s3_compatible_data_source using an unknown or untrusted endpoint. |
| `source_agent_pool_name` | Specifies the agent pool used for agent-based source transfers. | false | true | Agent pools control where transfer agents run and should reference approved managed pools only. | source_agent_pool_name = "transferJobs/agentPools/approved-pool" | source_agent_pool_name = "transferJobs/agentPools/unapproved-pool" |
| `include_prefixes_required` | Ensures the Storage Transfer job restricts transfer scope by defining object_conditions.include_prefixes. | false | true | Requiring include_prefixes reduces the risk of unintentionally transferring more objects than intended by limiting the transfer to approved object path prefixes. | object_conditions { include_prefixes = ["secure-data/"] } | No object_conditions.include_prefixes configured. |
