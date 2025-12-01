## 🛡️ Policy Deployment Engine: `api_gateway_gateway`

This section provides a concise policy evaluation for the `api_gateway_gateway` resource in GCP.

Reference: [Terraform Registry – api_gateway_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/api_gateway_gateway)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `api_config` | Resource name of the API Config for this Gateway. Format: projects/{project}/locations/global/apis/{api}/configs/{apiConfig}. When changing api configs please ensure the new config is a new resource and the [lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle) rule `create_before_destroy` is set. | true | false | The API Config specifies the configuration for the API Gateway and does not directly affect security posture. | None | None |
| `gateway_id` | Identifier to assign to the Gateway. Must be unique within scope of the parent resource(project). | true | false | The gateway identifier is used for resource identification and does not directly affect security posture. | None | None |
| `display_name` | A user-visible name for the API. | false | false | The display name is used for identification purposes and does not directly affect security posture. | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Resource labels are used for metadata and do not directly affect security posture. | None | None |
| `region` | The region of the gateway for the API. | false | false | The region of the gateway is used for resource identification and does not directly affect security posture. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | The project ID is used for resource identification and does not directly affect security posture. | None | None |
