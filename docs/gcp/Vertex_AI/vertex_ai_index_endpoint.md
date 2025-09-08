## 🛡️ Policy Deployment Engine: `vertex_ai_index_endpoint`

This section provides a concise policy evaluation for the `vertex_ai_index_endpoint` resource in GCP.

Reference: [Terraform Registry – vertex_ai_index_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_index_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The display name of the Index. The name can be up to 128 characters long and can consist of any UTF-8 characters. | true | None | None |
| `description` | The description of the Index. | false | None | None |
| `labels` | The labels with user-defined metadata to organize your Indexes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `network` | The full name of the Google Compute Engine [network](https://cloud.google.com//compute/docs/networks-and-firewalls#networks) to which the index endpoint should be peered. Private services access must already be configured for the network. If left unspecified, the index endpoint is not peered with any network. [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert): `projects/{project}/global/networks/{network}`. Where `{project}` is a project number, as in `12345`, and `{network}` is network name. | false | None | None |
| `public_endpoint_enabled` | If true, the deployed index will be accessible through public endpoint. | false | None | None |
| `region` | The region of the index endpoint. eg us-central1 | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### private_service_connect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_private_service_connect` | If set to true, the IndexEndpoint is created without private service access. | true | None | None |
| `project_allowlist` | A list of Projects from which the forwarding rule will target the service attachment. | false | None | None |
