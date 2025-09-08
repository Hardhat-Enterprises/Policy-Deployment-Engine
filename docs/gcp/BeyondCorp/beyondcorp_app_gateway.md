## 🛡️ Policy Deployment Engine: `beyondcorp_app_gateway`

This section provides a concise policy evaluation for the `beyondcorp_app_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_gateway)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | ID of the AppGateway. | true | None | None |
| `region` | The region of the AppGateway. | false | None | None |
| `type` | The type of network connectivity used by the AppGateway. Default value is `TYPE_UNSPECIFIED`. Possible values are: `TYPE_UNSPECIFIED`, `TCP_PROXY`. | false | None | None |
| `host_type` | The type of hosting used by the AppGateway. Default value is `HOST_TYPE_UNSPECIFIED`. Possible values are: `HOST_TYPE_UNSPECIFIED`, `GCP_REGIONAL_MIG`. | false | None | None |
| `display_name` | An arbitrary user-provided name for the AppGateway. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
