## 🛡️ Policy Deployment Engine: `apigee_flowhook`

This section provides a concise policy evaluation for the `apigee_flowhook` resource in GCP.

Reference: [Terraform Registry – apigee_flowhook](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_flowhook)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | The Apigee Organization associated with the environment | true | None | None |
| `environment` | The resource ID of the environment. | true | None | None |
| `flow_hook_point` | Where in the API call flow the flow hook is invoked. Must be one of PreProxyFlowHook, PostProxyFlowHook, PreTargetFlowHook, or PostTargetFlowHook. | true | None | None |
| `description` | Description of the flow hook. | false | None | None |
| `sharedflow` | Id of the Sharedflow attaching to a flowhook point. | true | None | None |
| `continue_on_error` | Flag that specifies whether execution should continue if the flow hook throws an exception. Set to true to continue execution. Set to false to stop execution if the flow hook throws an exception. Defaults to true. | false | None | None |
