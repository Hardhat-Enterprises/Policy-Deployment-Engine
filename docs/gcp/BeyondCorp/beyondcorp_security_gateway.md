## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `security_gateway_id` | Optional. User-settable SecurityGateway resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter. | true | false | This value is used to uniquely identify the SecurityGateway. Since it is user-settable, it may be chosen to follow a specific naming convention relevant to the user's organization. | None | None |
| `hubs` | Optional. Map of Hubs that represents regional data path deployment with GCP region as a key. Structure is [documented below](#nested_hubs). | false | true | This mapping allows for tailored configurations and optimizations based on regional characteristics. | None | None |
| `display_name` | Optional. An arbitrary user-provided name for the SecurityGateway. Cannot exceed 64 characters. | false | false | This is for user convenience and does not impact security. | None | None |
| `location` | , Deprecated) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. Must be omitted or set to `global`. ~> **Warning:** `location` is deprecated and will be removed in a future major release. | false | false | The location is fixed to `global` for this resource type, ensuring consistency in resource identification. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project context is essential for resource management and billing, but does not directly impact security. | None | None |
| `internet_gateway` | This attribute is read-only and reflects the configuration of the internet gateway associated with the SecurityGateway. Structure is [documented below](#nested_internet_gateway). | false | false | This configuration allows for internet access and management of IP addresses. | None | None |

### hubs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `region` | This refers to the GCP region where the Hub is located. Example: `australia-southeast1`. | true | true | Specifying the region allows for optimized routing and compliance with data residency requirements. | australia-southeast1, australia-southeast2 | us-central1, europe-west1 |
| `internet_gateway` | Internet Gateway configuration. Structure is [documented below](#nested_hubs_hub_internet_gateway). | false | false | This configuration allows for internet access and management of IP addresses. | None | None |

### internet_gateway Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `assigned_ips` | (Output) Output only. List of IP addresses assigned to the Cloud NAT. | false | false | This argument provides visibility into the IP addresses assigned to the Cloud NAT, which is important for network management and security monitoring. | None | None |
