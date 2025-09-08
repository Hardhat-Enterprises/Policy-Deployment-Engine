## 🛡️ Policy Deployment Engine: `access_context_manager_service_perimeter`

This section provides a concise policy evaluation for the `access_context_manager_service_perimeter` resource in GCP.

Reference: [Terraform Registry – access_context_manager_service_perimeter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `title` | Human readable title. Must be unique within the Policy. | true | None | None |
| `parent` | The AccessPolicy this ServicePerimeter lives in. Format: accessPolicies/{policy_id} | true | None | None |
| `name` | Resource name for the ServicePerimeter. The short_name component must begin with a letter and only include alphanumeric and '_'. Format: accessPolicies/{policy_id}/servicePerimeters/{short_name} | true | None | None |
| `description` | Description of the ServicePerimeter and its use. Does not affect behavior. | false | None | None |
| `perimeter_type` | Specifies the type of the Perimeter. There are two types: regular and bridge. Regular Service Perimeter contains resources, access levels, and restricted services. Every resource can be in at most ONE regular Service Perimeter. In addition to being in a regular service perimeter, a resource can also be in zero or more perimeter bridges. A perimeter bridge only contains resources. Cross project operations are permitted if all effected resources share some perimeter (whether bridge or regular). Perimeter Bridge does not contain access levels or services: those are governed entirely by the regular perimeter that resource is in. Perimeter Bridges are typically useful when building more complex topologies with many independent perimeters that need to share some data with a common perimeter, but should not be able to share data among themselves. Default value is `PERIMETER_TYPE_REGULAR`. Possible values are: `PERIMETER_TYPE_REGULAR`, `PERIMETER_TYPE_BRIDGE`. | false | None | None |
| `use_explicit_dry_run_spec` | Use explicit dry run spec flag. Ordinarily, a dry-run spec implicitly exists for all Service Perimeters, and that spec is identical to the status for those Service Perimeters. When this flag is set, it inhibits the generation of the implicit spec, thereby allowing the user to explicitly provide a configuration ("spec") to use in a dry-run version of the Service Perimeter. This allows the user to test changes to the enforced config ("status") without actually enforcing them. This testing is done through analyzing the differences between currently enforced and suggested restrictions. useExplicitDryRunSpec must bet set to True if any of the fields in the spec are set to non-default values. | false | None | None |

### status Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number} | false | None | None |
| `access_levels` | A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. For Service Perimeter Bridge, must be empty. Format: accessPolicies/{policy_id}/accessLevels/{access_level_name} | false | None | None |
| `restricted_services` | GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if `storage.googleapis.com` is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions. | false | None | None |
| `vpc_accessible_services` | Specifies how APIs are allowed to communicate within the Service Perimeter. Structure is [documented below](#nested_status_vpc_accessible_services). | false | None | None |
| `ingress_policies` | List of `IngressPolicies` to apply to the perimeter. A perimeter may have multiple `IngressPolicies`, each of which is evaluated separately. Access is granted if any `Ingress Policy` grants it. Must be empty for a perimeter bridge. Structure is [documented below](#nested_status_ingress_policies). | false | None | None |
| `egress_policies` | List of EgressPolicies to apply to the perimeter. A perimeter may have multiple EgressPolicies, each of which is evaluated separately. Access is granted if any EgressPolicy grants it. Must be empty for a perimeter bridge. Structure is [documented below](#nested_status_egress_policies). | false | None | None |

### spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number} | false | None | None |
| `access_levels` | A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. For Service Perimeter Bridge, must be empty. Format: accessPolicies/{policy_id}/accessLevels/{access_level_name} | false | None | None |
| `restricted_services` | GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if `storage.googleapis.com` is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions. | false | None | None |
| `vpc_accessible_services` | Specifies how APIs are allowed to communicate within the Service Perimeter. Structure is [documented below](#nested_spec_vpc_accessible_services). | false | None | None |
| `ingress_policies` | List of `IngressPolicies` to apply to the perimeter. A perimeter may have multiple `IngressPolicies`, each of which is evaluated separately. Access is granted if any `Ingress Policy` grants it. Must be empty for a perimeter bridge. Structure is [documented below](#nested_spec_ingress_policies). | false | None | None |
| `egress_policies` | List of EgressPolicies to apply to the perimeter. A perimeter may have multiple EgressPolicies, each of which is evaluated separately. Access is granted if any EgressPolicy grants it. Must be empty for a perimeter bridge. Structure is [documented below](#nested_spec_egress_policies). | false | None | None |

### vpc_accessible_services Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_restriction` | Whether to restrict API calls within the Service Perimeter to the list of APIs specified in 'allowedServices'. | false | None | None |
| `allowed_services` | The list of APIs usable within the Service Perimeter. Must be empty unless `enableRestriction` is True. | false | None | None |

### ingress_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ingress_from` | Defines the conditions on the source of a request causing this `IngressPolicy` to apply. Structure is [documented below](#nested_spec_ingress_policies_ingress_policies_ingress_from). | false | None | None |
| `ingress_to` | Defines the conditions on the `ApiOperation` and request destination that cause this `IngressPolicy` to apply. Structure is [documented below](#nested_spec_ingress_policies_ingress_policies_ingress_to). | false | None | None |
| `title` | Human readable title. Must be unique within the perimeter. Does not affect behavior. | false | None | None |

### ingress_from Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identity_type` | Specifies the type of identities that are allowed access from outside the perimeter. If left unspecified, then members of `identities` field will be allowed access. Possible values are: `IDENTITY_TYPE_UNSPECIFIED`, `ANY_IDENTITY`, `ANY_USER_ACCOUNT`, `ANY_SERVICE_ACCOUNT`. | false | None | None |
| `identities` | A list of identities that are allowed access through this ingress policy. Should be in the format of email address. The email address should represent individual user or service account only. | false | None | None |
| `sources` | Sources that this `IngressPolicy` authorizes access from. Structure is [documented below](#nested_spec_ingress_policies_ingress_policies_ingress_from_sources). | false | None | None |

### sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_level` | An AccessLevel resource name that allows resources outside the ServicePerimeter to be accessed from the inside. | false | None | None |
| `resource` | A Google Cloud resource that is allowed to egress the perimeter. Requests from these resources are allowed to access data outside the perimeter. Currently only projects are allowed. Project format: `projects/{project_number}`. The resource may be in any Google Cloud organization, not just the organization that the perimeter is defined in. `*` is not allowed, the case of allowing all Google Cloud resources only is not supported. | false | None | None |

### ingress_to Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of resources, currently only projects in the form `projects/<projectnumber>`, protected by this `ServicePerimeter` that are allowed to be accessed by sources defined in the corresponding `IngressFrom`. A request matches if it contains a resource in this list. If `*` is specified for resources, then this `IngressTo` rule will authorize access to all resources inside the perimeter, provided that the request also matches the `operations` field. | false | None | None |
| `roles` | A list of IAM roles that represent the set of operations that the sources specified in the corresponding `IngressFrom` are allowed to perform. | false | None | None |
| `operations` | A list of `ApiOperations` the sources specified in corresponding `IngressFrom` are allowed to perform in this `ServicePerimeter`. Structure is [documented below](#nested_spec_ingress_policies_ingress_policies_ingress_to_operations). | false | None | None |

### operations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The name of the API whose methods or permissions the `IngressPolicy` or `EgressPolicy` want to allow. A single `ApiOperation` with serviceName field set to `*` will allow all methods AND permissions for all services. | false | None | None |
| `method_selectors` | API methods or permissions to allow. Method or permission must belong to the service specified by `serviceName` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `serviceName`. Structure is [documented below](#nested_spec_egress_policies_egress_policies_egress_to_operations_operations_method_selectors). | false | None | None |

### method_selectors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `method` | Value for `method` should be a valid method name for the corresponding `serviceName` in `ApiOperation`. If `*` used as value for method, then ALL methods and permissions are allowed. | false | None | None |
| `permission` | Value for permission should be a valid Cloud IAM permission for the corresponding `serviceName` in `ApiOperation`. | false | None | None |

### egress_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `egress_from` | Defines conditions on the source of a request causing this `EgressPolicy` to apply. Structure is [documented below](#nested_spec_egress_policies_egress_policies_egress_from). | false | None | None |
| `egress_to` | Defines the conditions on the `ApiOperation` and destination resources that cause this `EgressPolicy` to apply. Structure is [documented below](#nested_spec_egress_policies_egress_policies_egress_to). | false | None | None |
| `title` | Human readable title. Must be unique within the perimeter. Does not affect behavior. | false | None | None |

### egress_from Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identity_type` | Specifies the type of identities that are allowed access to outside the perimeter. If left unspecified, then members of `identities` field will be allowed access. Possible values are: `IDENTITY_TYPE_UNSPECIFIED`, `ANY_IDENTITY`, `ANY_USER_ACCOUNT`, `ANY_SERVICE_ACCOUNT`. | false | None | None |
| `sources` | Sources that this EgressPolicy authorizes access from. Structure is [documented below](#nested_spec_egress_policies_egress_policies_egress_from_sources). | false | None | None |
| `source_restriction` | Whether to enforce traffic restrictions based on `sources` field. If the `sources` field is non-empty, then this field must be set to `SOURCE_RESTRICTION_ENABLED`. Possible values are: `SOURCE_RESTRICTION_UNSPECIFIED`, `SOURCE_RESTRICTION_ENABLED`, `SOURCE_RESTRICTION_DISABLED`. | false | None | None |
| `identities` | A list of identities that are allowed access through this `EgressPolicy`. Should be in the format of email address. The email address should represent individual user or service account only. | false | None | None |

### egress_to Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resources` | A list of resources, currently only projects in the form `projects/<projectnumber>`, that match this to stanza. A request matches if it contains a resource in this list. If * is specified for resources, then this `EgressTo` rule will authorize access to all resources outside the perimeter. | false | None | None |
| `external_resources` | A list of external resources that are allowed to be accessed. A request matches if it contains an external resource in this list (Example: s3://bucket/path). Currently '*' is not allowed. | false | None | None |
| `roles` | A list of IAM roles that represent the set of operations that the sources specified in the corresponding `EgressFrom` are allowed to perform. | false | None | None |
| `operations` | A list of `ApiOperations` that this egress rule applies to. A request matches if it contains an operation/service in this list. Structure is [documented below](#nested_spec_egress_policies_egress_policies_egress_to_operations). | false | None | None |
