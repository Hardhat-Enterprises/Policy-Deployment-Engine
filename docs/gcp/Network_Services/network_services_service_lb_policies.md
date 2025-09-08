## 🛡️ Policy Deployment Engine: `network_services_service_lb_policies`

This section provides a concise policy evaluation for the `network_services_service_lb_policies` resource in GCP.

Reference: [Terraform Registry – network_services_service_lb_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_service_lb_policies)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the ServiceLbPolicy resource. It matches pattern `projects/{project}/locations/{location}/serviceLbPolicies/{service_lb_policy_name}`. | true | None | None |
| `location` | The location of the service lb policy. | true | None | None |
| `labels` | Set of label tags associated with the ServiceLbPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `load_balancing_algorithm` | The type of load balancing algorithm to be used. The default behavior is WATERFALL_BY_REGION. Possible values are: `SPRAY_TO_REGION`, `SPRAY_TO_WORLD`, `WATERFALL_BY_REGION`, `WATERFALL_BY_ZONE`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### auto_capacity_drain Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable` | Optional. If set to 'True', an unhealthy MIG/NEG will be set as drained. - An MIG/NEG is considered unhealthy if less than 25% of the instances/endpoints in the MIG/NEG are healthy. - This option will never result in draining more than 50% of the configured IGs/NEGs for the Backend Service. | false | None | None |

### failover_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `failover_health_threshold` | Optional. The percentage threshold that a load balancer will begin to send traffic to failover backends. If the percentage of endpoints in a MIG/NEG is smaller than this value, traffic would be sent to failover backends if possible. This field should be set to a value between 1 and 99. The default value is 50 for Global external HTTP(S) load balancer (classic) and Proxyless service mesh, and 70 for others. | true | None | None |
