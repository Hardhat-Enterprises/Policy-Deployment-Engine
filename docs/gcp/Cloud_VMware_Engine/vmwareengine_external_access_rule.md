## 🛡️ Policy Deployment Engine: `vmwareengine_external_access_rule`

This section provides a concise policy evaluation for the `vmwareengine_external_access_rule` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_access_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_access_rule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `priority` | External access rule priority, which determines the external access rule to use when multiple rules apply. | true | true | Priority controls which rule is evaluated first when multiple external access rules apply. Incorrect priority values may cause a less restrictive rule to be applied before a safer rule. | 101 | 1 |
| `action` | The action that the external access rule performs. Possible values are: `ALLOW`, `DENY`. | true | true | The action determines whether matching traffic is allowed or denied. Incorrect use of ALLOW can expose workloads to unwanted external access. | DENY | ALLOW |
| `ip_protocol` | The IP protocol to which the external access rule applies. | true | true | The protocol determines which type of network traffic is affected by the rule. Only approved protocols should be allowed to reduce unnecessary exposure. | TCP | UDP |
| `source_ip_ranges` | If source ranges are specified, the external access rule applies only to traffic that has a source IP address in these ranges. Structure is [documented below](#nested_source_ip_ranges). | true | true | Source IP ranges control where traffic can originate from. Broad ranges such as 0.0.0.0/0 can expose the resource to traffic from any source. | None | None |
| `source_ports` | A list of source ports to which the external access rule applies. | true | true | Source ports should be limited to approved ports. Using wildcard ports opens the rule to all source ports. | 80 | * |
| `destination_ip_ranges` | If destination ranges are specified, the external access rule applies only to traffic that has a destination IP address in these ranges. Structure is [documented below](#nested_destination_ip_ranges). | true | false | None | None | None |
| `destination_ports` | A list of destination ports to which the external access rule applies. | true | true | Destination ports should be restricted to approved ports. Using wildcard ports may expose all destination services. | 443 | * |
| `parent` | The resource name of the network policy. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/networkPolicies/my-policy | true | true | The parent value determines which network policy the external access rule belongs to. Using an approved parent helps ensure that the rule is applied within the correct controlled network policy. | projects/599444694846/locations/us-west1/networkPolicies/c | projects/599444694846/locations/us-west1/networkPolicies/nc |
| `name` | The ID of the external access rule. | true | true | External access rule names should follow an approved naming standard so that rules can be clearly identified, audited, and managed consistently. | c | nc |
| `description` | User-provided description for the external access rule. | false | false | The description is used for documentation and does not directly change the access behaviour of the rule. | None | None |

### source_ip_ranges Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_address` | A single IP address. | false | true | A source IP address should be restricted to approved trusted addresses only. | 100.0.0.1 | 0.0.0.0 |
| `ip_address_range` | An IP address range in the CIDR format. | false | true | Source CIDR ranges should avoid broad public ranges. Allowing 0.0.0.0/0 permits traffic from any source address. | 100.0.0.0/24 | 0.0.0.0/0 |

### destination_ip_ranges Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_address_range` | An IP address range in the CIDR format. | false | false | None | None | None |
| `external_address` | The name of an `ExternalAddress` resource. | false | false | None | None | None |
