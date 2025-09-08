## 🛡️ Policy Deployment Engine: `firebase_data_connect_service`

This section provides a concise policy evaluation for the `firebase_data_connect_service` resource in GCP.

Reference: [Terraform Registry – firebase_data_connect_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_data_connect_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The region in which the service resides, e.g. "us-central1" or "asia-east1". | true | None | None |
| `service_id` | Required. The ID to use for the service, which will become the final component of the service's resource name. | true | None | None |
| `display_name` | Optional. Mutable human-readable name. 63 character limit. | false | None | None |
| `annotations` | Optional. Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | Service to be deleted even if a Schema or Connector is present. By default, the Service deletion will only succeed when no Schema or Connectors are present. Possible values: DEFAULT, FORCE | none | None | None |
