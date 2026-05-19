## 🛡️ Policy Deployment Engine: `vmwareengine_network_policy`

This section provides a concise policy evaluation for the `vmwareengine_network_policy` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `edge_services_cidr` | IP address range in CIDR notation used to create internet access and external IP access. An RFC 1918 CIDR block, with a "/26" prefix, is required. The range cannot overlap with any prefixes either in the consumer VPC network or in use by the private clouds attached to that VPC network. | true | true | The edge services CIDR controls the address range used for internet access and external IP access. An approved non-overlapping CIDR range helps prevent routing conflicts and unintended exposure. | 192.168.30.0/26 | 10.0.0.0/24 |
| `vmware_engine_network` | The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | true | true | The VMware Engine network determines which network the policy applies to. Using an approved network ensures the policy is attached only to trusted VMware Engine network resources. | projects/599444694846/locations/global/vmwareEngineNetworks/c | projects/599444694846/locations/global/vmwareEngineNetworks/nc |
| `location` | The resource name of the location (region) to create the new network policy in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-central1 | true | true | The location controls where the network policy is created. | australia-southeast1 | us-east1 |
| `name` | The ID of the Network Policy. | true | true | Network policy names should follow an approved naming standard so that policies can be clearly identified, audited, and managed consistently. | c | nc |
| `description` | User-provided description for this network policy. | false | false | The description is used for documentation and does not directly change the security behaviour | None | None |
| `internet_access` | Network service that allows VMware workloads to access the internet. Structure is [documented below](#nested_internet_access). | false | true | Internet access can allow VMware workloads to communicate with external internet services. This should be disabled unless explicitly approved. | None | None |
| `external_ip` | Network service that allows External IP addresses to be assigned to VMware workloads. This service can only be enabled when internetAccess is also enabled. Structure is [documented below](#nested_external_ip). | false | true | External IP access can expose VMware workloads to external network access. It should be disabled unless explicitly approved. | None | None |
| `project` | If it is not provided, the provider project is used. | false | true | The project determines where the network policy is created. Using an approved project keeps the policy within the correct governance, access control, and billing boundary. | project-d7f19645-ccba-48ef-bce | unapproved-project |

### internet_access Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | True if the service is enabled; false otherwise. | false | true | Enabling internet access may expose workloads to external network communication. It should be disabled unless the organisation has approved the requirement. | False | True |
| `state` | (Output) State of the service. New values may be added to this enum when appropriate. | false | false | This is an output-only state field and is not directly configured by the policy. | None | None |

### external_ip Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | True if the service is enabled; false otherwise. | false | true | Enabling external IP access may expose workloads externally. It should be disabled to reduce unnecessary public exposure. | False | True |
| `state` | (Output) State of the service. New values may be added to this enum when appropriate. | false | false | This is an output-only state field and is not directly configured by the policy. | None | None |
