## 🛡️ Policy Deployment Engine: `firebase_data_connect_service`

This section provides a concise policy evaluation for the `firebase_data_connect_service` resource in GCP.

Reference: [Terraform Registry – firebase_data_connect_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_data_connect_service)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The region in which the service resides, e.g. "us-central1" or "asia-east1". | true | false | The location attribute determines the physical region where the service is deployed. It does not directly affect security, but it may have compliance or data residency implications depending on organizational and regulatory requirements. | None | None |
| `service_id` | Required. The ID to use for the service, which will become the final component of the service's resource name. | true | false | The service_id uniquely identifies the Firebase Data Connect Service. It has no direct security impact as long as appropriate IAM permissions govern access to the resource. | None | None |
| `display_name` | Optional. Mutable human-readable name. 63 character limit. | false | false | The display_name is only a user-friendly label for ease of identification. It does not affect access control, authentication, or security enforcement. | None | None |
| `annotations` | Optional. Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations provide metadata for resource organization or automation. They do not influence authentication, authorization, or data protection mechanisms, so there is no direct security impact. | None | None |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are used for categorization, billing, or resource grouping. They do not impact access control or security and are safe to configure for organizational purposes only. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project attribute links the service to a Firebase/Google Cloud project. Security and access are controlled at the project level via IAM, not by this attribute directly. | None | None |
| `deletion_policy` | Service to be deleted even if a Schema or Connector is present. By default, the Service deletion will only succeed when no Schema or Connectors are present. Possible values: DEFAULT, FORCE | false | true | Setting 'deletion_policy' to 'FORCE' ensures the service and all dependent resources, such as schemas or connectors, are fully deleted. This prevents the risk of leaving behind orphaned configurations or unused resources that may introduce compliance, cost, or security management issues. Leaving it at 'DEFAULT' may block deletion when dependencies exist, leading to incomplete lifecycle management. | FORCE | DEFAULT |
