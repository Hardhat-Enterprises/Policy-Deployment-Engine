## 🛡️ Policy Deployment Engine: `api_gateway_api_config`

This section provides a concise policy evaluation for the `api_gateway_api_config` resource in GCP.

Reference: [Terraform Registry – api_gateway_api_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/api_gateway_api_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `api` | The API to attach the config to. Used to find the parent resource to bind the IAM policy to | true | false | Identifies the parent API for context only. It does not assign access or modify permissions, so it has no direct security effect. | None | None |
| `display_name` | A user-visible name for the API. | false | false | This is a display name for the API configuration and has no impact on security. | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels are used for governance tracking and security classification. They indicate environment, ownership, cost allocation, and API sensitivity, supporting auditing and compliance requirements. | None | None |
| `gateway_config` | Immutable. Gateway specific configuration. If not specified, backend authentication will be set to use OIDC authentication using the default compute service account Structure is [documented below](#nested_gateway_config). | false | false | Represents high-level gateway behaviour, but its internal security settings cannot be validated at this policy level. | None | None |
| `openapi_documents` | OpenAPI specification documents. If specified, grpcServices and managedServiceConfigs must not be included. Structure is [documented below](#nested_openapi_documents). | false | false | Contains the API specification content, but it is provided as base64-encoded data. Security configuration inside the spec cannot be validated at this policy level, and developers are responsible for defining secure API specifications. | None | None |
| `grpc_services` | gRPC service definition files. If specified, openapiDocuments must not be included. Structure is [documented below](#nested_grpc_services). | false | false | Provides service definitions only. The policy cannot enforce secure gRPC configuration here, and security requirements must be implemented by developers within the service definitions themselves. | None | None |
| `managed_service_configs` | Optional. Service Configuration files. At least one must be included when using gRPC service definitions. See https://cloud.google.com/endpoints/docs/grpc/grpc-service-config#service_configuration_overview for the expected file contents. If multiple files are specified, the files are merged with the following rules: * All singular scalar fields are merged using "last one wins" semantics in the order of the files uploaded. * Repeated fields are concatenated. * Singular embedded messages are merged using these rules for nested fields. Structure is [documented below](#nested_managed_service_configs). | false | false | Represents deployment metadata used by API Gateway. It does not expose or control security behaviour directly, and detailed security validation cannot be performed at this layer. | None | None |
| `api_config_id` | Identifier to assign to the API Config. Must be unique within scope of the parent resource(api). | false | false | Provides a unique identifier for the API configuration but does not influence security settings or access controls. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Defines where the resource is created. IAM enforcement already occurs at the project level, so this field does not introduce new security impact. | None | None |
| `api_config_id_prefix` | specified prefix. If this and api_config_id are unspecified, a random value is chosen for the name. | false | false | Provides a prefix for generating a unique API configuration identifier but does not influence security settings or access controls. | None | None |
| `backend_config` |  | false | false | Configures backend authentication using a Google Cloud IAM service account to sign OIDC tokens. While it supports secure backend communication, the policy cannot validate the security of the backend configuration itself. | None | None |
| `document` |  | false | false | None | None | None |
| `file_descriptor_set` |  | false | false | None | None | None |
| `source` |  | false | false | None | None | None |

### gateway_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backend_config` | Backend settings that are applied to all backends of the Gateway. Structure is [documented below](#nested_gateway_config_backend_config). | true | false | None | None | None |

### openapi_documents Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `document` | The OpenAPI Specification document file. Structure is [documented below](#nested_openapi_documents_openapi_documents_document). | true | false | None | None | None |

### grpc_services Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `file_descriptor_set` | Input only. File descriptor set, generated by protoc. To generate, use protoc with imports and source info included. For an example test.proto file, the following command would put the value in a new file named out.pb. $ protoc --include_imports --include_source_info test.proto -o out.pb Structure is [documented below](#nested_grpc_services_grpc_services_file_descriptor_set). | true | false | None | None | None |
| `source` | Uncompiled proto files associated with the descriptor set, used for display purposes (server-side compilation is not supported). These should match the inputs to 'protoc' command used to generate fileDescriptorSet. Structure is [documented below](#nested_grpc_services_grpc_services_source). | false | false | None | None | None |

### managed_service_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The file path (full or relative path). This is typically the path of the file when it is uploaded. | true | false | None | None | None |
| `contents` | Base64 encoded content of the file. | true | false | None | None | None |

### backend_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `google_service_account` | Google Cloud IAM service account used to sign OIDC tokens for backends that have authentication configured (https://cloud.google.com/service-infrastructure/docs/service-management/reference/rest/v1/services.configs#backend). | true | false | None | None | None |

### document Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The file path (full or relative path). This is typically the path of the file when it is uploaded. | true | false | None | None | None |
| `contents` | Base64 encoded content of the file. | true | false | None | None | None |

### file_descriptor_set Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The file path (full or relative path). This is typically the path of the file when it is uploaded. | true | false | None | None | None |
| `contents` | Base64 encoded content of the file. | true | false | None | None | None |

### source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The file path (full or relative path). This is typically the path of the file when it is uploaded. | true | false | None | None | None |
| `contents` | Base64 encoded content of the file. | true | false | None | None | None |
