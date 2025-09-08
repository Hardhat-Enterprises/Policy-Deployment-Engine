## 🛡️ Policy Deployment Engine: `cloud_ids_endpoint`

This section provides a concise policy evaluation for the `cloud_ids_endpoint` resource in GCP.

Reference: [Terraform Registry – cloud_ids_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_ids_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the endpoint in the format projects/{project_id}/locations/{locationId}/endpoints/{endpointId}. | true | None | None |
| `network` | Name of the VPC network that is connected to the IDS endpoint. This can either contain the VPC network name itself (like "src-net") or the full URL to the network (like "projects/{project_id}/global/networks/src-net"). | true | None | None |
| `severity` | The minimum alert severity level that is reported by the endpoint. Possible values are: `INFORMATIONAL`, `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`. | true | None | None |
| `location` | The location for the endpoint. | true | None | None |
| `description` | An optional description of the endpoint. | false | None | None |
| `threat_exceptions` | Configuration for threat IDs excluded from generating alerts. Limit: 99 IDs. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
