## 🛡️ Policy Deployment Engine: `compute_region_network_endpoint_group`

This section provides a concise policy evaluation for the `compute_region_network_endpoint_group` resource in GCP.

Reference: [Terraform Registry – compute_region_network_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `region` | A reference to the region where the regional NEGs reside. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `network_endpoint_type` | Type of network endpoints in this network endpoint group. Defaults to SERVERLESS. Default value is `SERVERLESS`. Possible values are: `SERVERLESS`, `PRIVATE_SERVICE_CONNECT`, `INTERNET_IP_PORT`, `INTERNET_FQDN_PORT`, `GCE_VM_IP_PORTMAP`. | false | None | None |
| `psc_target_service` | This field is only used for PSC and INTERNET NEGs. The target service url used to set up private service connection to a Google API or a PSC Producer Service Attachment. | false | None | None |
| `network` | This field is only used for PSC and INTERNET NEGs. The URL of the network to which all network endpoints in the NEG belong. Uses "default" project network if unspecified. | false | None | None |
| `subnetwork` | This field is only used for PSC NEGs. Optional URL of the subnetwork to which all network endpoints in the NEG belong. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### psc_data Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `producer_port` | The PSC producer port to use when consumer PSC NEG connects to a producer. If this flag isn't specified for a PSC NEG with endpoint type private-service-connect, then PSC NEG will be connected to a first port in the available PSC producer port range. | false | None | None |

### cloud_run Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Cloud Run service is the main resource of Cloud Run. The service must be 1-63 characters long, and comply with RFC1035. Example value: "run-service". | false | None | None |
| `tag` | Cloud Run tag represents the "named-revision" to provide additional fine-grained traffic routing information. The tag must be 1-63 characters long, and comply with RFC1035. Example value: "revision-0010". | false | None | None |
| `url_mask` | A template to parse service and tag fields from a request URL. URL mask allows for routing to multiple Run services without having to create multiple network endpoint groups and backend services. For example, request URLs "foo1.domain.com/bar1" and "foo1.domain.com/bar2" an be backed by the same Serverless Network Endpoint Group (NEG) with URL mask ".domain.com/". The URL mask will parse them to { service="bar1", tag="foo1" } and { service="bar2", tag="foo2" } respectively. | false | None | None |

### app_engine Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Optional serving service. The service name must be 1-63 characters long, and comply with RFC1035. Example value: "default", "my-service". | false | None | None |
| `version` | Optional serving version. The version must be 1-63 characters long, and comply with RFC1035. Example value: "v1", "v2". | false | None | None |
| `url_mask` | A template to parse service and version fields from a request URL. URL mask allows for routing to multiple App Engine services without having to create multiple Network Endpoint Groups and backend services. For example, the request URLs "foo1-dot-appname.appspot.com/v1" and "foo1-dot-appname.appspot.com/v2" can be backed by the same Serverless NEG with URL mask "-dot-appname.appspot.com/". The URL mask will parse them to { service = "foo1", version = "v1" } and { service = "foo1", version = "v2" } respectively. | false | None | None |

### cloud_function Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `function` | A user-defined name of the Cloud Function. The function name is case-sensitive and must be 1-63 characters long. Example value: "func1". | false | None | None |
| `url_mask` | A template to parse function field from a request URL. URL mask allows for routing to multiple Cloud Functions without having to create multiple Network Endpoint Groups and backend services. For example, request URLs "mydomain.com/function1" and "mydomain.com/function2" can be backed by the same Serverless NEG with URL mask "/". The URL mask will parse them to { function = "function1" } and { function = "function2" } respectively. | false | None | None |

### serverless_deployment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `platform` | The platform of the NEG backend target(s). Possible values: API Gateway: apigateway.googleapis.com | true | None | None |
| `resource` | The user-defined name of the workload/instance. This value must be provided explicitly or in the urlMask. The resource identified by this value is platform-specific and is as follows: API Gateway: The gateway ID, App Engine: The service name, Cloud Functions: The function name, Cloud Run: The service name | false | None | None |
| `version` | The optional resource version. The version identified by this value is platform-specific and is follows: API Gateway: Unused, App Engine: The service version, Cloud Functions: Unused, Cloud Run: The service tag | false | None | None |
| `url_mask` | A template to parse platform-specific fields from a request URL. URL mask allows for routing to multiple resources on the same serverless platform without having to create multiple Network Endpoint Groups and backend resources. The fields parsed by this template are platform-specific and are as follows: API Gateway: The gateway ID, App Engine: The service and version, Cloud Functions: The function name, Cloud Run: The service and tag | false | None | None |
