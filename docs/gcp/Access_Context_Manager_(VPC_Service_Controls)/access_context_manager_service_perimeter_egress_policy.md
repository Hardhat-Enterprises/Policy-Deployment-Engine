## 🛡️ Policy Deployment Engine: `access_context_manager_service_perimeter_egress_policy`

This section provides a concise policy evaluation for the `access_context_manager_service_perimeter_egress_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_service_perimeter_egress_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter_egress_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `perimeter` | The name of the Service Perimeter to add this resource to. | true | None | None |
| `title` | Human readable title. Must be unique within the perimeter. Does not affect behavior. | false | None | None |

### egress_from Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identity_type` | Specifies the type of identities that are allowed access to outside the perimeter. If left unspecified, then members of `identities` field will be allowed access. Possible values are: `ANY_IDENTITY`, `ANY_USER_ACCOUNT`, `ANY_SERVICE_ACCOUNT`. | false | None | None |
| `identities` | Identities can be an individual user, service account, Google group, or third-party identity. For third-party identity, only single identities are supported and other identity types are not supported.The v1 identities that have the prefix user, group and serviceAccount in https://cloud.google.com/iam/docs/principal-identifiers#v1 are supported. | false | None | None |
| `sources` | Sources that this EgressPolicy authorizes access from. Structure is [documented below](#nested_egress_from_sources). | false | None | None |
| `source_restriction` | Whether to enforce traffic restrictions based on `sources` field. If the `sources` field is non-empty, then this field must be set to `SOURCE_RESTRICTION_ENABLED`. Possible values are: `SOURCE_RESTRICTION_UNSPECIFIED`, `SOURCE_RESTRICTION_ENABLED`, `SOURCE_RESTRICTION_DISABLED`. | false | None | None |

### egress_to Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of resources, currently only projects in the form `projects/<projectnumber>`, that match this to stanza. A request matches if it contains a resource in this list. If * is specified for resources, then this `EgressTo` rule will authorize access to all resources outside the perimeter. | false | None | None |
| `external_resources` | A list of external resources that are allowed to be accessed. A request matches if it contains an external resource in this list (Example: s3://bucket/path). Currently '*' is not allowed. | false | None | None |
| `roles` | A list of IAM roles that represent the set of operations that the sources specified in the corresponding `EgressFrom` are allowed to perform. | false | None | None |
| `operations` | A list of `ApiOperations` that this egress rule applies to. A request matches if it contains an operation/service in this list. Structure is [documented below](#nested_egress_to_operations). | false | None | None |

### sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_level` | An AccessLevel resource name that allows resources outside the ServicePerimeter to be accessed from the inside. | false | None | None |
| `resource` | A Google Cloud resource that is allowed to egress the perimeter. Requests from these resources are allowed to access data outside the perimeter. Currently only projects are allowed. Project format: `projects/{project_number}`. The resource may be in any Google Cloud organization, not just the organization that the perimeter is defined in. `*` is not allowed, the case of allowing all Google Cloud resources only is not supported. | false | None | None |

### operations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The name of the API whose methods or permissions the `IngressPolicy` or `EgressPolicy` want to allow. A single `ApiOperation` with serviceName field set to `*` will allow all methods AND permissions for all services. | false | None | None |
| `method_selectors` | API methods or permissions to allow. Method or permission must belong to the service specified by `serviceName` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `serviceName`. Structure is [documented below](#nested_egress_to_operations_operations_method_selectors). | false | None | None |

### method_selectors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `method` | Value for `method` should be a valid method name for the corresponding `serviceName` in `ApiOperation`. If `*` used as value for method, then ALL methods and permissions are allowed. | false | None | None |
| `permission` | Value for permission should be a valid Cloud IAM permission for the corresponding `serviceName` in `ApiOperation`. | false | None | None |
