## 🛡️ Policy Deployment Engine: `network_security_authz_policy`

This section provides a concise policy evaluation for the `network_security_authz_policy` resource in GCP.

Reference: [Terraform Registry – network_security_authz_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_authz_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Specifies the set of resources to which this policy should be applied to. Structure is [documented below](#nested_target). | true | false | None | None | None |
| `action` | When the action is CUSTOM, customProvider must be specified. When the action is ALLOW, only requests matching the policy will be allowed. When the action is DENY, only requests matching the policy will be denied. When a request arrives, the policies are evaluated in the following order: 1. If there is a CUSTOM policy that matches the request, the CUSTOM policy is evaluated using the custom authorization providers and the request is denied if the provider rejects the request. 2. If there are any DENY policies that match the request, the request is denied. 3. If there are no ALLOW policies for the resource or if any of the ALLOW policies match the request, the request is allowed. 4. Else the request is denied by default if none of the configured AuthzPolicies with ALLOW action match the request. Possible values are: `ALLOW`, `DENY`, `CUSTOM`. | true | false | None | None | None |
| `name` | Identifier. Name of the AuthzPolicy resource. | true | false | None | None | None |
| `location` | The location of the resource. | true | false | None | None | None |
| `description` | A human-readable description of the resource. | false | false | None | None | None |
| `labels` | Set of labels associated with the AuthzExtension resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `http_rules` | A list of authorization HTTP rules to match against the incoming request.A policy match occurs when at least one HTTP rule matches the request or when no HTTP rules are specified in the policy. At least one HTTP Rule is required for Allow or Deny Action. Limited to 5 rules. Structure is [documented below](#nested_http_rules). | false | false | None | None | None |
| `custom_provider` | Required if the action is CUSTOM. Allows delegating authorization decisions to Cloud IAP or to Service Extensions. One of cloudIap or authzExtension must be specified. Structure is [documented below](#nested_custom_provider). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `from` |  | false | false | None | None | None |
| `sources` |  | false | false | None | None | None |
| `principals` |  | false | false | None | None | None |
| `resources` |  | false | false | None | None | None |
| `tag_value_id_set` |  | false | false | None | None | None |
| `iam_service_account` |  | false | false | None | None | None |
| `not_sources` |  | false | false | None | None | None |
| `to` |  | false | false | None | None | None |
| `operations` |  | false | false | None | None | None |
| `header_set` |  | false | false | None | None | None |
| `headers` |  | false | false | None | None | None |
| `value` |  | false | false | None | None | None |
| `hosts` |  | false | false | None | None | None |
| `paths` |  | false | false | None | None | None |
| `not_operations` |  | false | false | None | None | None |
| `cloud_iap` |  | false | false | None | None | None |
| `authz_extension` |  | false | false | None | None | None |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `load_balancing_scheme` | All gateways and forwarding rules referenced by this policy and extensions must share the same load balancing scheme. For more information, refer to [Backend services overview](https://cloud.google.com/load-balancing/docs/backend-service). Possible values are: `INTERNAL_MANAGED`, `EXTERNAL_MANAGED`, `INTERNAL_SELF_MANAGED`. | true | false | None | None | None |
| `resources` | A list of references to the Forwarding Rules on which this policy will be applied. | false | false | None | None | None |

### http_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `from` | Describes properties of one or more sources of a request. Structure is [documented below](#nested_http_rules_http_rules_from). | false | false | None | None | None |
| `to` | Describes properties of one or more targets of a request Structure is [documented below](#nested_http_rules_http_rules_to). | false | false | None | None | None |
| `when` | CEL expression that describes the conditions to be satisfied for the action. The result of the CEL expression is ANDed with the from and to. Refer to the CEL language reference for a list of available attributes. | false | false | None | None | None |

### custom_provider Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_iap` | Delegates authorization decisions to Cloud IAP. Applicable only for managed load balancers. Enabling Cloud IAP at the AuthzPolicy level is not compatible with Cloud IAP settings in the BackendService. Enabling IAP in both places will result in request failure. Ensure that IAP is enabled in either the AuthzPolicy or the BackendService but not in both places. Structure is [documented below](#nested_custom_provider_cloud_iap). | false | false | None | None | None |
| `authz_extension` | Delegate authorization decision to user authored Service Extension. Only one of cloudIap or authzExtension can be specified. Structure is [documented below](#nested_custom_provider_authz_extension). | false | false | None | None | None |

### from Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sources` | Describes the properties of a request's sources. At least one of sources or notSources must be specified. Limited to 5 sources. A match occurs when ANY source (in sources or notSources) matches the request. Within a single source, the match follows AND semantics across fields and OR semantics within a single field, i.e. a match occurs when ANY principal matches AND ANY ipBlocks match. Structure is [documented below](#nested_http_rules_http_rules_from_sources). | false | false | None | None | None |
| `not_sources` | Describes the properties of a request's sources. At least one of sources or notSources must be specified. Limited to 5 sources. A match occurs when ANY source (in sources or notSources) matches the request. Within a single source, the match follows AND semantics across fields and OR semantics within a single field, i.e. a match occurs when ANY principal matches AND ANY ipBlocks match. Structure is [documented below](#nested_http_rules_http_rules_from_not_sources). | false | false | None | None | None |

### sources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principals` | A list of identities derived from the client's certificate. This field will not match on a request unless mutual TLS is enabled for the Forwarding rule or Gateway. Each identity is a string whose value is matched against the URI SAN, or DNS SAN or the subject field in the client's certificate. The match can be exact, prefix, suffix or a substring match. One of exact, prefix, suffix or contains must be specified. Limited to 5 principals. Structure is [documented below](#nested_http_rules_http_rules_from_sources_sources_principals). | false | false | None | None | None |
| `resources` | A list of resources to match against the resource of the source VM of a request. Limited to 5 resources. Structure is [documented below](#nested_http_rules_http_rules_from_sources_sources_resources). | false | false | None | None | None |

### principals Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ignore_case` | If true, indicates the exact/prefix/suffix/contains matching should be case insensitive. For example, the matcher data will match both input string Data and data if set to true. | false | false | None | None | None |
| `exact` | The input string must match exactly the string specified here. Examples: * abc only matches the value abc. | false | false | None | None | None |
| `prefix` | The input string must have the prefix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value abc.xyz | false | false | None | None | None |
| `suffix` | The input string must have the suffix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc | false | false | None | None | None |
| `contains` | The input string must have the substring specified here. Note: empty contains match is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc.def | false | false | None | None | None |

### resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `tag_value_id_set` | A list of resource tag value permanent IDs to match against the resource manager tags value associated with the source VM of a request. Structure is [documented below](#nested_http_rules_http_rules_from_not_sources_not_sources_resources_resources_tag_value_id_set). | false | false | None | None | None |
| `iam_service_account` | An IAM service account to match against the source service account of the VM sending the request. Structure is [documented below](#nested_http_rules_http_rules_from_not_sources_not_sources_resources_resources_iam_service_account). | false | false | None | None | None |

### tag_value_id_set Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ids` | A list of resource tag value permanent IDs to match against the resource manager tags value associated with the source VM of a request. The match follows AND semantics which means all the ids must match. Limited to 5 matches. | false | false | None | None | None |

### iam_service_account Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ignore_case` | If true, indicates the exact/prefix/suffix/contains matching should be case insensitive. For example, the matcher data will match both input string Data and data if set to true. | false | false | None | None | None |
| `exact` | The input string must match exactly the string specified here. Examples: * abc only matches the value abc. | false | false | None | None | None |
| `prefix` | The input string must have the prefix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value abc.xyz | false | false | None | None | None |
| `suffix` | The input string must have the suffix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc | false | false | None | None | None |
| `contains` | The input string must have the substring specified here. Note: empty contains match is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc.def | false | false | None | None | None |

### not_sources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principals` | A list of identities derived from the client's certificate. This field will not match on a request unless mutual TLS is enabled for the Forwarding rule or Gateway. Each identity is a string whose value is matched against the URI SAN, or DNS SAN or the subject field in the client's certificate. The match can be exact, prefix, suffix or a substring match. One of exact, prefix, suffix or contains must be specified. Limited to 5 principals. Structure is [documented below](#nested_http_rules_http_rules_from_not_sources_not_sources_principals). | false | false | None | None | None |
| `resources` | A list of resources to match against the resource of the source VM of a request. Limited to 5 resources. Structure is [documented below](#nested_http_rules_http_rules_from_not_sources_not_sources_resources). | false | false | None | None | None |

### to Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `operations` | Describes properties of one or more targets of a request. At least one of operations or notOperations must be specified. Limited to 5 operations. A match occurs when ANY operation (in operations or notOperations) matches. Within an operation, the match follows AND semantics across fields and OR semantics within a field, i.e. a match occurs when ANY path matches AND ANY header matches and ANY method matches. Structure is [documented below](#nested_http_rules_http_rules_to_operations). | false | false | None | None | None |
| `not_operations` | Describes the negated properties of the targets of a request. Matches requests for operations that do not match the criteria specified in this field. At least one of operations or notOperations must be specified. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations). | false | false | None | None | None |

### operations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header_set` | A list of headers to match against in http header. Structure is [documented below](#nested_http_rules_http_rules_to_operations_operations_header_set). | false | false | None | None | None |
| `hosts` | A list of HTTP Hosts to match against. The match can be one of exact, prefix, suffix, or contains (substring match). Matches are always case sensitive unless the ignoreCase is set. Limited to 5 matches. Structure is [documented below](#nested_http_rules_http_rules_to_operations_operations_hosts). | false | false | None | None | None |
| `paths` | A list of paths to match against. The match can be one of exact, prefix, suffix, or contains (substring match). Matches are always case sensitive unless the ignoreCase is set. Limited to 5 matches. Note that this path match includes the query parameters. For gRPC services, this should be a fully-qualified name of the form /package.service/method. Structure is [documented below](#nested_http_rules_http_rules_to_operations_operations_paths). | false | false | None | None | None |
| `methods` | A list of HTTP methods to match against. Each entry must be a valid HTTP method name (GET, PUT, POST, HEAD, PATCH, DELETE, OPTIONS). It only allows exact match and is always case sensitive. | false | false | None | None | None |

### header_set Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `headers` | A list of headers to match against in http header. The match can be one of exact, prefix, suffix, or contains (substring match). The match follows AND semantics which means all the headers must match. Matches are always case sensitive unless the ignoreCase is set. Limited to 5 matches. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations_not_operations_header_set_headers). | false | false | None | None | None |

### headers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Specifies the name of the header in the request. | false | false | None | None | None |
| `value` | Specifies how the header match will be performed. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations_not_operations_header_set_headers_headers_value). | false | false | None | None | None |

### value Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ignore_case` | If true, indicates the exact/prefix/suffix/contains matching should be case insensitive. For example, the matcher data will match both input string Data and data if set to true. | false | false | None | None | None |
| `exact` | The input string must match exactly the string specified here. Examples: * abc only matches the value abc. | false | false | None | None | None |
| `prefix` | The input string must have the prefix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value abc.xyz | false | false | None | None | None |
| `suffix` | The input string must have the suffix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc | false | false | None | None | None |
| `contains` | The input string must have the substring specified here. Note: empty contains match is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc.def | false | false | None | None | None |

### hosts Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ignore_case` | If true, indicates the exact/prefix/suffix/contains matching should be case insensitive. For example, the matcher data will match both input string Data and data if set to true. | false | false | None | None | None |
| `exact` | The input string must match exactly the string specified here. Examples: * abc only matches the value abc. | false | false | None | None | None |
| `prefix` | The input string must have the prefix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value abc.xyz | false | false | None | None | None |
| `suffix` | The input string must have the suffix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc | false | false | None | None | None |
| `contains` | The input string must have the substring specified here. Note: empty contains match is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc.def | false | false | None | None | None |

### paths Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ignore_case` | If true, indicates the exact/prefix/suffix/contains matching should be case insensitive. For example, the matcher data will match both input string Data and data if set to true. | false | false | None | None | None |
| `exact` | The input string must match exactly the string specified here. Examples: * abc only matches the value abc. | false | false | None | None | None |
| `prefix` | The input string must have the prefix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value abc.xyz | false | false | None | None | None |
| `suffix` | The input string must have the suffix specified here. Note: empty prefix is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc | false | false | None | None | None |
| `contains` | The input string must have the substring specified here. Note: empty contains match is not allowed, please use regex instead. Examples: * abc matches the value xyz.abc.def | false | false | None | None | None |

### not_operations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header_set` | A list of headers to match against in http header. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations_not_operations_header_set). | false | false | None | None | None |
| `hosts` | A list of HTTP Hosts to match against. The match can be one of exact, prefix, suffix, or contains (substring match). Matches are always case sensitive unless the ignoreCase is set. Limited to 5 matches. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations_not_operations_hosts). | false | false | None | None | None |
| `paths` | A list of paths to match against. The match can be one of exact, prefix, suffix, or contains (substring match). Matches are always case sensitive unless the ignoreCase is set. Limited to 5 matches. Note that this path match includes the query parameters. For gRPC services, this should be a fully-qualified name of the form /package.service/method. Structure is [documented below](#nested_http_rules_http_rules_to_not_operations_not_operations_paths). | false | false | None | None | None |
| `methods` | A list of HTTP methods to match against. Each entry must be a valid HTTP method name (GET, PUT, POST, HEAD, PATCH, DELETE, OPTIONS). It only allows exact match and is always case sensitive. | false | false | None | None | None |

### cloud_iap Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Enable Cloud IAP at the AuthzPolicy level. | true | false | None | None | None |

### authz_extension Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resources` | A list of references to authorization extensions that will be invoked for requests matching this policy. Limited to 1 custom provider. | true | false | None | None | None |
