## 🛡️ Policy Deployment Engine: `network_connectivity_service_connection_policy`

This section provides a concise policy evaluation for the `network_connectivity_service_connection_policy` resource in GCP.

Reference: [Terraform Registry – network_connectivity_service_connection_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_service_connection_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_class` | The service class identifier for which this ServiceConnectionPolicy is for. The service class identifier is a unique, symbolic representation of a ServiceClass. It is provided by the Service Producer. Google services have a prefix of gcp. For example, gcp-cloud-sql. 3rd party services do not. For example, test-service-a3dfcx. | true | None | None |
| `network` | The resource path of the consumer network. Example: - projects/{projectNumOrId}/global/networks/{resourceId}. | true | None | None |
| `name` | The name of a ServiceConnectionPolicy. Format: projects/{project}/locations/{location}/serviceConnectionPolicies/{service_connection_policy} See: https://google.aip.dev/122#fields-representing-resource-names | true | None | None |
| `location` | The location of the ServiceConnectionPolicy. | true | None | None |
| `description` | Free-text description of the resource. | false | None | None |
| `labels` | User-defined labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### psc_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subnetworks` | IDs of the subnetworks or fully qualified identifiers for the subnetworks | true | None | None |
| `producer_instance_location` | ProducerInstanceLocation is used to specify which authorization mechanism to use to determine which projects the Producer instance can be within. Possible values are: `PRODUCER_INSTANCE_LOCATION_UNSPECIFIED`, `CUSTOM_RESOURCE_HIERARCHY_LEVELS`. | false | None | None |
| `allowed_google_producers_resource_hierarchy_level` | List of Projects, Folders, or Organizations from where the Producer instance can be within. For example, a network administrator can provide both 'organizations/foo' and 'projects/bar' as allowed_google_producers_resource_hierarchy_levels. This allowlists this network to connect with any Producer instance within the 'foo' organization or the 'bar' project. By default, allowedGoogleProducersResourceHierarchyLevel is empty. The format for each allowedGoogleProducersResourceHierarchyLevel is / where is one of 'projects', 'folders', or 'organizations' and is either the ID or the number of the resource type. Format for each allowedGoogleProducersResourceHierarchyLevel value: 'projects/' or 'folders/' or 'organizations/' Eg. [projects/my-project-id, projects/567, folders/891, organizations/123] | false | None | None |
| `limit` | Max number of PSC connections for this policy. | false | None | None |
