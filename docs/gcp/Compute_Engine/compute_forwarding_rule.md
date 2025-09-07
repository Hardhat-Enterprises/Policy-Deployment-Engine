## 🛡️ Policy Deployment Engine: `compute_forwarding_rule`

This section provides a concise policy evaluation for the `compute_forwarding_rule` resource in GCP.

Reference: [Terraform Registry – compute_forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with [RFC1035](https://www.ietf.org/rfc/rfc1035.txt). Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. For Private Service Connect forwarding rules that forward traffic to Google APIs, the forwarding rule name must be a 1-20 characters string with lowercase letters and numbers and must start with a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_mirroring_collector`
- Description: (Optional) Indicates whether or not this load balancer can be used as a collector for packet mirroring. To prevent mirroring loops, instances behind this load balancer will not have their traffic mirrored even if a `PacketMirroring` rule applies to them. This can only be set to true for load balancers that have their `loadBalancingScheme` set to `INTERNAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) IP address for which this forwarding rule accepts traffic. When a client sends traffic to this IP address, the forwarding rule directs the traffic to the referenced `target` or `backendService`. While creating a forwarding rule, specifying an `IPAddress` is required under the following circumstances: * When the `target` is set to `targetGrpcProxy` and `validateForProxyless` is set to `true`, the `IPAddress` should be set to `0.0.0.0`. * When the `target` is a Private Service Connect Google APIs bundle, you must specify an `IPAddress`. Otherwise, you can optionally specify an IP address that references an existing static (reserved) IP address resource. When omitted, Google Cloud assigns an ephemeral IP address. Use one of the following formats to specify an IP address while creating a forwarding rule: * IP address number, as in `100.1.2.3` * IPv6 address range, as in `2600:1234::/96` * Full resource URL, as in `https://www.googleapis.com/compute/v1/projects/project_id/regions/region/addresses/address-name` * Partial URL or by name, as in:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Optional) The IP protocol to which this rule applies. For protocol forwarding, valid options are `TCP`, `UDP`, `ESP`, `AH`, `SCTP`, `ICMP` and `L3_DEFAULT`. The valid IP protocols are different for different load balancing products as described in [Load balancing features](https://cloud.google.com/load-balancing/docs/features#protocols_from_the_load_balancer_to_the_backends). A Forwarding Rule with protocol L3_DEFAULT can attach with target instance or backend service with UNSPECIFIED protocol. A forwarding rule with "L3_DEFAULT" IPProtocal cannot be attached to a backend service with TCP or UDP. Possible values are: `TCP`, `UDP`, `ESP`, `AH`, `SCTP`, `ICMP`, `L3_DEFAULT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Optional) Identifies the backend service to which the forwarding rule sends traffic. Required for Internal TCP/UDP Load Balancing and Network Load Balancing; must be omitted for all other load balancer types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancing_scheme`
- Description: (Optional) Specifies the forwarding rule type. Note that an empty string value (`""`) is also supported for some use cases, for example PSC (private service connection) regional forwarding rules. For more information about forwarding rules, refer to [Forwarding rule concepts](https://cloud.google.com/load-balancing/docs/forwarding-rule-concepts). Default value is `EXTERNAL`. Possible values are: `EXTERNAL`, `EXTERNAL_MANAGED`, `INTERNAL`, `INTERNAL_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) This field is not used for external load balancing. For Internal TCP/UDP Load Balancing, this field identifies the network that the load balanced IP should belong to for this Forwarding Rule. If the subnetwork is specified, the network of the subnetwork will be used. If neither subnetwork nor this field is specified, the default network will be used. For Private Service Connect forwarding rules that forward traffic to Google APIs, a network must be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_range`
- Description: (Optional) The `ports`, `portRange`, and `allPorts` fields are mutually exclusive. Only packets addressed to ports in the specified range will be forwarded to the backends configured with this forwarding rule. The `portRange` field has the following limitations: * It requires that the forwarding rule `IPProtocol` be TCP, UDP, or SCTP, and * It's applicable only to the following products: external passthrough Network Load Balancers, internal and external proxy Network Load Balancers, internal and external Application Load Balancers, external protocol forwarding, and Classic VPN. * Some products have restrictions on what ports can be used. See [port specifications](https://cloud.google.com/load-balancing/docs/forwarding-rule-concepts#port_specifications) for details. For external forwarding rules, two or more forwarding rules cannot use the same `[IPAddress, IPProtocol]` pair, and cannot have overlapping `portRange`s. For internal forwarding rules within the same VPC network, two or more forwarding rules cannot use the same `[IPAddress, IPProtocol]` pair, and cannot have overlapping `portRange`s. @pattern: \d+(?:-\d+)?
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) The `ports`, `portRange`, and `allPorts` fields are mutually exclusive. Only packets addressed to ports in the specified range will be forwarded to the backends configured with this forwarding rule. The `ports` field has the following limitations: * It requires that the forwarding rule `IPProtocol` be TCP, UDP, or SCTP, and * It's applicable only to the following products: internal passthrough Network Load Balancers, backend service-based external passthrough Network Load Balancers, and internal protocol forwarding. * You can specify a list of up to five ports by number, separated by commas. The ports can be contiguous or discontiguous. For external forwarding rules, two or more forwarding rules cannot use the same `[IPAddress, IPProtocol]` pair if they share at least one port number. For internal forwarding rules within the same VPC network, two or more forwarding rules cannot use the same `[IPAddress, IPProtocol]` pair if they share at least one port number. @pattern: \d+(?:-\d+)?
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) This field identifies the subnetwork that the load balanced IP should belong to for this Forwarding Rule, used in internal load balancing and network load balancing with IPv6. If the network specified is in auto subnet mode, this field is optional. However, a subnetwork must be specified if the network is in custom subnet mode or when creating external forwarding rule with IPv6.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) The URL of the target resource to receive the matched traffic.  For regional forwarding rules, this target must be in the same region as the forwarding rule. For global forwarding rules, this target must be a global load balancing resource. The forwarded traffic must be of a type appropriate to the target object. *  For load balancers, see the "Target" column in [Port specifications](https://cloud.google.com/load-balancing/docs/forwarding-rule-concepts#ip_address_specifications). For Private Service Connect forwarding rules that forward traffic to managed services, the target must be a service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_global_access`
- Description: (Optional) This field is used along with the `backend_service` field for internal load balancing or with the `target` field for internal TargetInstance. If the field is set to `TRUE`, clients can access ILB from all regions. Otherwise only allows access from clients in the same region as the internal load balancer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this forwarding rule.  A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_ports`
- Description: (Optional) The `ports`, `portRange`, and `allPorts` fields are mutually exclusive. Only packets addressed to ports in the specified range will be forwarded to the backends configured with this forwarding rule. The `allPorts` field has the following limitations: * It requires that the forwarding rule `IPProtocol` be TCP, UDP, SCTP, or L3_DEFAULT. * It's applicable only to the following products: internal passthrough Network Load Balancers, backend service-based external passthrough Network Load Balancers, and internal and external protocol forwarding. * Set this field to true to allow packets addressed to any port or packets lacking destination port information (for example, UDP fragments after the first fragment) to be forwarded to the backends configured with this forwarding rule. The L3_DEFAULT protocol requires `allPorts` be set to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tier`
- Description: (Optional) This signifies the networking tier used for configuring this load balancer and can only take the following values: `PREMIUM`, `STANDARD`. For regional ForwardingRule, the valid values are `PREMIUM` and `STANDARD`. For GlobalForwardingRule, the valid value is `PREMIUM`. If this field is not specified, it is assumed to be `PREMIUM`. If `IPAddress` is specified, this value must be equal to the networkTier of the Address. Possible values are: `PREMIUM`, `STANDARD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_registrations`
- Description: (Optional) Service Directory resources to register this forwarding rule with. Currently, only supports a single Service Directory resource. Structure is [documented below](#nested_service_directory_registrations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_label`
- Description: (Optional) An optional prefix to the service name for this Forwarding Rule. If specified, will be the first label of the fully qualified service name. The label must be 1-63 characters long, and comply with RFC1035. Specifically, the label must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. This field is only used for INTERNAL load balancing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_ip_ranges`
- Description: (Optional) If not empty, this Forwarding Rule will only forward the traffic when the source IP address matches one of the IP addresses or CIDR ranges set here. Note that a Forwarding Rule can only have up to 64 source IP ranges, and this field can only be used with a regional Forwarding Rule whose scheme is EXTERNAL. Each sourceIpRange entry should be either an IP address (for example, 1.2.3.4) or a CIDR range (for example, 1.2.3.0/24).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_psc_global_access`
- Description: (Optional) This is used in PSC consumer ForwardingRule to control whether the PSC endpoint can be accessed from another region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_automate_dns_zone`
- Description: (Optional) This is used in PSC consumer ForwardingRule to control whether it should try to auto-generate a DNS zone or not. Non-PSC forwarding rules do not use this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_version`
- Description: (Optional) The IP address version that will be used by this forwarding rule. Valid options are IPV4 and IPV6. If not set, the IPv4 address will be used by default. Possible values are: `IPV4`, `IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_collection`
- Description: (Optional) Resource reference of a PublicDelegatedPrefix. The PDP must be a sub-PDP in EXTERNAL_IPV6_FORWARDING_RULE_CREATION mode. Use one of the following formats to specify a sub-PDP when creating an IPv6 NetLB forwarding rule using BYOIP: Full resource URL, as in:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) A reference to the region where the regional forwarding rule resides. This field is not applicable to global forwarding rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recreate_closed_psc`
- Description: <a name="nested_service_directory_registrations"></a>The `service_directory_registrations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) Service Directory namespace to register the forwarding rule under.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) Service Directory service to register the forwarding rule under.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
