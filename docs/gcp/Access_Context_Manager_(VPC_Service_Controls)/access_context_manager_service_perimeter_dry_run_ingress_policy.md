## 🛡️ Policy Deployment Engine: `access_context_manager_service_perimeter_dry_run_ingress_policy`

This section provides a concise policy evaluation for the `access_context_manager_service_perimeter_dry_run_ingress_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_service_perimeter_dry_run_ingress_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter_dry_run_ingress_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `perimeter` | The name of the Service Perimeter to add this resource to. | true | None | None |
| `title` | Human readable title. Must be unique within the perimeter. Does not affect behavior. | false | None | None |

### ingress_from Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identity_type` | Specifies the type of identities that are allowed access from outside the perimeter. If left unspecified, then members of `identities` field will be allowed access. Possible values are: `ANY_IDENTITY`, `ANY_USER_ACCOUNT`, `ANY_SERVICE_ACCOUNT`. | false | None | None |
| `identities` | Identities can be an individual user, service account, Google group, or third-party identity. For third-party identity, only single identities are supported and other identity types are not supported.The v1 identities that have the prefix user, group and serviceAccount in https://cloud.google.com/iam/docs/principal-identifiers#v1 are supported. | false | None | None |
| `sources` | Sources that this `IngressPolicy` authorizes access from. Structure is [documented below](#nested_ingress_from_sources). | false | None | None |

### ingress_to Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of resources, currently only projects in the form `projects/<projectnumber>`, protected by this `ServicePerimeter` that are allowed to be accessed by sources defined in the corresponding `IngressFrom`. A request matches if it contains a resource in this list. If `*` is specified for resources, then this `IngressTo` rule will authorize access to all resources inside the perimeter, provided that the request also matches the `operations` field. | false | None | None |
| `roles` | A list of IAM roles that represent the set of operations that the sources specified in the corresponding `IngressFrom` are allowed to perform. | false | None | None |
| `operations` | A list of `ApiOperations` the sources specified in corresponding `IngressFrom` are allowed to perform in this `ServicePerimeter`. Structure is [documented below](#nested_ingress_to_operations). | false | None | None |

### sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_level` | An `AccessLevel` resource name that allow resources within the `ServicePerimeters` to be accessed from the internet. `AccessLevels` listed must be in the same policy as this `ServicePerimeter`. Referencing a nonexistent `AccessLevel` will cause an error. If no `AccessLevel` names are listed, resources within the perimeter can only be accessed via Google Cloud calls with request origins within the perimeter. Example `accessPolicies/MY_POLICY/accessLevels/MY_LEVEL.` If * is specified, then all IngressSources will be allowed. | false | None | None |
| `resource` | A Google Cloud resource that is allowed to ingress the perimeter. Requests from these resources will be allowed to access perimeter data. Currently only projects are allowed. Format `projects/{project_number}` The project may be in any Google Cloud organization, not just the organization that the perimeter is defined in. `*` is not allowed, the case of allowing all Google Cloud resources only is not supported. | false | None | None |

### operations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The name of the API whose methods or permissions the `IngressPolicy` or `EgressPolicy` want to allow. A single `ApiOperation` with `serviceName` field set to `*` will allow all methods AND permissions for all services. | false | None | None |
| `method_selectors` | API methods or permissions to allow. Method or permission must belong to the service specified by serviceName field. A single `MethodSelector` entry with `*` specified for the method field will allow all methods AND permissions for the service specified in `serviceName`. Structure is [documented below](#nested_ingress_to_operations_operations_method_selectors). | false | None | None |

### method_selectors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `method` | Value for method should be a valid method name for the corresponding serviceName in `ApiOperation`. If `*` used as value for `method`, then ALL methods and permissions are allowed. | false | None | None |
| `permission` | Value for permission should be a valid Cloud IAM permission for the corresponding `serviceName` in `ApiOperation`. | false | None | None |
