## 🛡️ Policy Deployment Engine: `firebase_extensions_instance`

This section provides a concise policy evaluation for the `firebase_extensions_instance` resource in GCP.

Reference: [Terraform Registry – firebase_extensions_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_extensions_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_id` | The ID to use for the Extension Instance, which will become the final component of the instance's name. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) The unique identifier for this configuration. | none | None | None |
| `create_time` | (Output) The time at which the Extension Instance Config was created. | none | None | None |
| `params` | Environment variables that may be configured for the Extension | true | None | None |
| `system_params` | Params whose values are only available at deployment time. Unlike other params, these will not be set as environment variables on functions. See a full list of system parameters at https://firebase.google.com/docs/extensions/publishers/parameters#system_parameters | false | None | None |
| `extension_ref` | The ref of the Extension from the Registry (e.g. publisher-id/awesome-extension) | true | None | None |
| `extension_version` | The version of the Extension from the Registry (e.g. 1.0.3). If left blank, latest is assumed. | false | None | None |
| `allowed_event_types` | List of extension events selected by consumer that extension is allowed to emit, identified by their types. | false | None | None |
| `eventarc_channel` | Fully qualified Eventarc resource name that consumers should use for event triggers. | false | None | None |
| `populated_postinstall_content` | (Output) Postinstall instructions to be shown for this Extension, with template strings representing function and parameter values substituted with actual values. These strings include: ${param:FOO}, ${function:myFunc.url}, ${function:myFunc.name}, and ${function:myFunc.location} | none | None | None |
