## 🛡️ Policy Deployment Engine: `beyondcorp_app_gateway`

This section provides a concise policy evaluation for the `beyondcorp_app_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_gateway)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | ID of the AppGateway. | true | false | The name field is required to uniquely identify the AppGateway resource within a project and location. | None | None |
| `region` | The region of the AppGateway. | false | true | The region field is used to specify the geographical location of the AppGateway, which can have implications for data residency and latency. | australia-southeast1, australia-southeast2 | europe-west1, us-central1 |
| `type` | The type of network connectivity used by the AppGateway. Default value is `TYPE_UNSPECIFIED`. Possible values are: `TYPE_UNSPECIFIED`, `TCP_PROXY`. Only `TCP_PROXY` is allowed. | false | false | The type field is used to specify the network connectivity type for the AppGateway. To comply with policy, only 'TCP_PROXY' should be used. | ['TCP_PROXY'] | ['TYPE_UNSPECIFIED'] |
| `host_type` | The type of hosting used by the AppGateway. Default value is `HOST_TYPE_UNSPECIFIED`. Possible values are: `HOST_TYPE_UNSPECIFIED`, `GCP_REGIONAL_MIG`. | false | true | The host type field is used to specify the hosting type for the AppGateway. Only 'GCP_REGIONAL_MIG' is allowed for compliance. | ['GCP_REGIONAL_MIG'] | ['HOST_TYPE_UNSPECIFIED'] |
| `display_name` | An arbitrary user-provided name for the AppGateway. | false | false | Display name is for user convenience and does not impact security. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are used for metadata and do not directly impact security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used to identify the project resource. Some organisations may have policies that restrict which projects can be used, but this is not inherently a security issue. | None | None |
