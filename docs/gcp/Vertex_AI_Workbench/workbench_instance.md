## 🛡️ Policy Deployment Engine: `workbench_instance`

This section provides a concise policy evaluation for the `workbench_instance` resource in GCP.

Reference: [Terraform Registry – workbench_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of this workbench instance. Format: `projects/{project_id}/locations/{location}/instances/{instance_id}` | true | false | This is a resource identifier only. It does not affect the security posture of the instance. | None | None |
| `location` | Part of `parent`. See documentation of `projectsId`. | true | false | Defines the zone for instance placement. Data residency is enforced by organisational policies, not this attribute directly. | None | None |
| `gce_setup` | The definition of how to configure a VM instance outside of Resources and Identity. Structure is [documented below](#nested_gce_setup). | false | false | This is a container block for VM configuration. Security impact is determined by its individual sub-attributes, not the block itself. | None | None |
| `instance_owners` | 'Optional. Input only. The owner of this instance after creation. Format: `alias@example.com` Currently supports one owner only. If not specified, all of the service account users of your VM instance''s service account can use the instance. If specified, sets the access mode to `Single user`. For more details, see https://cloud.google.com/vertex-ai/docs/workbench/instances/manage-access-jupyterlab' | false | true | If omitted, all service account users can access the notebook, violating the principle of least privilege. Specifying instance_owners enforces single-user access mode. | instance_owners = ["user@example.com"] | instance_owners omitted |
| `disable_proxy_access` | Optional. If true, the workbench instance will not register with the proxy. | false | true | The Workbench proxy enforces IAM authentication to JupyterLab. Disabling it removes the primary access control layer. Combined with a public IP, this gives unauthenticated access from the internet. | disable_proxy_access = false | disable_proxy_access = true |
| `enable_third_party_identity` | Flag that specifies that a notebook can be accessed with third party identity provider. | false | true | Enabling third-party identity provider access broadens the trust boundary beyond Google Cloud IAM, introducing federated authentication risks. | enable_third_party_identity = false | enable_third_party_identity = true |
| `enable_managed_euc` | Flag to enable managed end user credentials for the instance. | false | true | Without managed end-user credentials, API calls use the VM service account identity and audit logs will not reflect the actual user, undermining accountability and traceability. | enable_managed_euc = true | enable_managed_euc = false |
| `instance_id` | Required. User-defined unique ID of this instance. | false | false | This is a user-defined identifier for the instance. It does not affect the security posture. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Specifies the GCP project for the resource. Project-level security is governed by IAM and Organisation Policy, not by this attribute. | None | None |
| `desired_state` |  | false | false | Controls whether the instance is ACTIVE or STOPPED. This is a lifecycle and cost management attribute with no direct security impact. | None | None |
| `accelerator_configs` |  | false | false | This is a container block for GPU accelerator configuration. It has no direct security impact. | None | None |
| `shielded_instance_config` |  | false | false | This is a container block for Shielded VM settings. Security impact is determined by its individual sub-attributes. | None | None |
| `service_accounts` |  | false | false | This is a container block for service account configuration. Security impact is determined by its sub-attribute (email). | None | None |
| `vm_image` |  | false | false | This is a container block for VM image selection. It has no direct security impact. | None | None |
| `container_image` |  | false | false | This is a container block for container image selection. It has no direct security impact. | None | None |
| `boot_disk` |  | false | false | This is a container block for boot disk configuration. Security impact is determined by its sub-attributes (disk_encryption, kms_key). | None | None |
| `data_disks` |  | false | false | This is a container block for data disk configuration. Security impact is determined by its sub-attributes (disk_encryption, kms_key). | None | None |
| `network_interfaces` |  | false | false | This is a container block for network configuration. Security impact is determined by its sub-attributes (network, subnet, access_configs). | None | None |
| `access_configs` |  | false | false | This is a container block for external IP configuration. Security impact is determined by its sub-attribute (external_ip). | None | None |
| `confidential_instance_config` |  | false | false | This is a container block for Confidential VM configuration. Security impact is determined by its sub-attribute (confidential_instance_type). | None | None |
| `reservation_affinity` |  | false | false | This is a container block for capacity reservation scheduling. It has no security impact. | None | None |

### gce_setup Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `machine_type` | Optional. The machine type of the VM instance. https://cloud.google.com/compute/docs/machine-resource | false | false | Defines compute capacity (CPU/memory). This is a performance and cost attribute with no direct security impact. | None | None |
| `accelerator_configs` | The hardware accelerators used on this instance. If you use accelerators, make sure that your configuration has [enough vCPUs and memory to support the `machine_type` you have selected](https://cloud.google.com/compute/docs/gpus/#gpus-list). Currently supports only one accelerator configuration. Structure is [documented below](#nested_gce_setup_accelerator_configs). | false | false | This is a container block for GPU configuration. It controls hardware acceleration type and count, which are performance attributes. | None | None |
| `shielded_instance_config` | A set of Shielded Instance options. See [Images using supported Shielded VM features](https://cloud.google.com/compute/docs/instances/modifying-shielded-vm). Not all combinations are valid. Structure is [documented below](#nested_gce_setup_shielded_instance_config). | false | false | This is a container block for Shielded VM settings. Security impact is determined by its individual sub-attributes (enable_secure_boot, enable_vtpm, enable_integrity_monitoring). | None | None |
| `service_accounts` | The service account that serves as an identity for the VM instance. Currently supports only one service account. Structure is [documented below](#nested_gce_setup_service_accounts). | false | false | This is a container block for service account configuration. Security impact is determined by its sub-attribute (email). | None | None |
| `vm_image` | Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM. Structure is [documented below](#nested_gce_setup_vm_image). | false | false | This is a container block for VM image selection. Image governance is managed at the registry and IAM layer, not through this attribute. | None | None |
| `container_image` | Use a container image to start the workbench instance. Structure is [documented below](#nested_gce_setup_container_image). | false | false | This is a container block for container image selection. Image governance is managed at the registry and IAM layer, not through this attribute. | None | None |
| `boot_disk` | The definition of a boot disk. Structure is [documented below](#nested_gce_setup_boot_disk). | false | false | This is a container block for boot disk configuration. Security impact is determined by its sub-attributes (disk_encryption, kms_key). | None | None |
| `data_disks` | Data disks attached to the VM instance. Currently supports only one data disk. Structure is [documented below](#nested_gce_setup_data_disks). | false | false | This is a container block for data disk configuration. Security impact is determined by its sub-attributes (disk_encryption, kms_key). | None | None |
| `network_interfaces` | The network interfaces for the VM. Supports only one interface. Structure is [documented below](#nested_gce_setup_network_interfaces). | false | false | This is a container block for network configuration. Security impact is determined by its sub-attributes (network, subnet, access_configs). | None | None |
| `disable_public_ip` | Optional. If true, no external IP will be assigned to this VM instance. | false | true | Public IPs expose the notebook VM directly to the internet, creating an attack surface for unauthorised access, data exfiltration, and cryptojacking. This setting is immutable after instance creation and defaults to false (public IP assigned). | disable_public_ip = true | disable_public_ip = false |
| `tags` | Optional. The Compute Engine tags to add to instance (see [Tagging instances](https://cloud.google.com/compute/docs/label-or-tag-resources#tags)). | false | true | Tags are used to target VPC firewall rules. Without them, the instance may not be subject to the correct network security controls. | tags = ["notebook-restricted", "no-internet"] | tags omitted |
| `metadata` | Optional. Custom metadata to apply to this instance. | false | true | Metadata keys control critical runtime behaviours including root access (notebook-disable-root), file downloads (notebook-disable-downloads), terminal access (notebook-disable-terminal), SSH key access (block-project-ssh-keys), and idle shutdown (idle-timeout-seconds). | metadata = { "notebook-disable-root" = "true", "notebook-disable-downloads" = "true", "notebook-disable-terminal" = "true", "block-project-ssh-keys" = "true", "idle-timeout-seconds" = "3600" } | metadata omitted or security keys set to false |
| `enable_ip_forwarding` | Optional. Flag to enable ip forwarding or not, default false/off. https://cloud.google.com/vpc/docs/using-routes#canipforward | false | true | A notebook instance has no legitimate need to route traffic. Enabling IP forwarding allows the VM to act as a network router, which can be exploited for lateral movement between networks. | enable_ip_forwarding = false | enable_ip_forwarding = true |
| `confidential_instance_config` | Confidential instance configuration. Structure is [documented below](#nested_gce_setup_confidential_instance_config). | false | false | This is a container block for Confidential VM configuration. Security impact is determined by its sub-attribute (confidential_instance_type). | None | None |
| `reservation_affinity` | Reservations that this instance can consume from. Structure is [documented below](#nested_gce_setup_reservation_affinity). | false | false | This is a container block for capacity reservation scheduling. It has no security impact. | None | None |

### accelerator_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Optional. Type of this accelerator. Possible values are: `NVIDIA_TESLA_P100`, `NVIDIA_TESLA_V100`, `NVIDIA_TESLA_P4`, `NVIDIA_TESLA_T4`, `NVIDIA_TESLA_A100`, `NVIDIA_A100_80GB`, `NVIDIA_L4`, `NVIDIA_TESLA_T4_VWS`, `NVIDIA_TESLA_P100_VWS`, `NVIDIA_TESLA_P4_VWS`. | false | false | Specifies the GPU hardware type. This is a performance attribute with no security impact. | None | None |
| `core_count` | Optional. Count of cores of this accelerator. | false | false | Specifies the number of GPU cores. This is a performance attribute with no security impact. | None | None |

### shielded_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_secure_boot` | Optional. Defines whether the VM instance has Secure Boot enabled. Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default. | false | true | Disabled by default. Without Secure Boot, the VM can execute unsigned or tampered boot-level code, enabling rootkits and bootkits that operate below the operating system. | enable_secure_boot = true | enable_secure_boot = false |
| `enable_vtpm` | Optional. Defines whether the VM instance has the vTPM enabled. Enabled by default. | false | true | vTPM provides measured boot integrity validation and supports disk encryption key protection. Enabled by default but must not be explicitly disabled. | enable_vtpm = true | enable_vtpm = false |
| `enable_integrity_monitoring` | Optional. Defines whether the VM instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the VM instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the VM instance is created. Enabled by default. | false | true | Detects runtime boot sequence tampering that may indicate rootkit or bootkit compromise. Enabled by default but must not be explicitly disabled. | enable_integrity_monitoring = true | enable_integrity_monitoring = false |

### service_accounts Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Optional. Email address of the service account. | false | true | If omitted, the VM uses the default Compute Engine service account which has the Editor role on the entire project. Any code running in the notebook executes with near-admin permissions. | email = "custom-sa@my-project.iam.gserviceaccount.com" | service_accounts block omitted (defaults to Compute Engine default SA) |
| `scopes` | (Output) Output only. The list of scopes to be made available for this service account. Set by the CLH to https://www.googleapis.com/auth/cloud-platform | false | false | This is an output-only attribute set automatically by GCP to cloud-platform scope. It cannot be configured in Terraform. | None | None |

### vm_image Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The name of the Google Cloud project that this VM image belongs to. Format: {project_id} | false | false | Specifies which project owns the VM image. Image governance is managed at the registry and IAM layer, not through this attribute. | None | None |
| `name` | Optional. Use VM image name to find the image. | false | false | Specifies the VM image name. This is a functional attribute for image selection with no security impact. | None | None |
| `family` | Optional. Use this VM image family to find the image; the newest image in this family will be used. | false | false | Specifies the VM image family. This is a functional attribute for image selection with no security impact. | None | None |

### container_image Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | false | Specifies the container image repository path. Image governance is managed at the registry and IAM layer, not through this attribute. | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | false | Specifies the container image tag. This is a functional attribute for image version selection with no security impact. | None | None |

### boot_disk Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disk_size_gb` | Optional. The size of the boot disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to the recommended value of 150GB. | false | false | Specifies disk capacity. This is a storage sizing attribute with no security impact. | None | None |
| `disk_type` | Optional. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | false | Specifies disk performance class. This is a storage performance attribute with no security impact. | None | None |
| `disk_encryption` | Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`. | false | true | The default (GMEK) provides no key revocation capability during incidents. CMEK gives organisational control over key lifecycle, rotation, and revocation via Cloud KMS. This setting is immutable after creation. | disk_encryption = "CMEK" | disk_encryption = "GMEK" |
| `kms_key` | 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' | false | true | Required when disk_encryption is CMEK. Without a KMS key, CMEK cannot be applied and encryption falls back to GMEK. | kms_key = "projects/my-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key" | kms_key omitted when disk_encryption is CMEK |

### data_disks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disk_size_gb` | Optional. The size of the disk in GB attached to this VM instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to 100. | false | false | Specifies disk capacity. This is a storage sizing attribute with no security impact. | None | None |
| `disk_type` | Optional. Input only. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | false | Specifies disk performance class. This is a storage performance attribute with no security impact. | None | None |
| `disk_encryption` | Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`. | false | true | Data disks store notebooks, datasets, and model outputs which may contain sensitive information. CMEK provides organisational key control and revocation capability during incidents. | disk_encryption = "CMEK" | disk_encryption = "GMEK" |
| `kms_key` | 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' | false | true | Required when disk_encryption is CMEK. Without a KMS key, CMEK cannot be applied and encryption falls back to GMEK. | kms_key = "projects/my-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key" | kms_key omitted when disk_encryption is CMEK |

### network_interfaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Optional. The name of the VPC that this VM instance is in. | false | true | If omitted or set to default, the instance uses the default VPC which has overly permissive auto-created firewall rules allowing ingress on common ports. | network = "projects/my-project/global/networks/approved-vpc" | network = "default" |
| `subnet` | Optional. The name of the subnet that this VM instance is in. | false | true | If omitted, GCP auto-selects a subnet which may place the instance in an uncontrolled network segment without appropriate security controls. | subnet = "projects/my-project/regions/australia-southeast2/subnetworks/approved-subnet" | subnet omitted |
| `nic_type` | Optional. The type of vNIC to be used on this interface. This may be gVNIC or VirtioNet. Possible values are: `VIRTIO_NET`, `GVNIC`. | false | false | Specifies the virtual network interface driver type. This is a performance attribute with no security impact. | None | None |
| `access_configs` | Optional. An array of configurations for this interface. Currently, only one access config, ONE_TO_ONE_NAT, is supported. If no accessConfigs specified, the instance will have an external internet access through an ephemeral external IP address. Structure is [documented below](#nested_gce_setup_network_interfaces_network_interfaces_access_configs). | false | true | Assigns a static external IP to the instance, making it persistently and predictably reachable from the internet even when disable_public_ip is misconfigured. | access_configs block removed entirely | access_configs block present with external_ip specified |

### access_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `external_ip` | An external IP address associated with this instance. Specify an unused static external IP address available to the project or leave this field undefined to use an IP from a shared ephemeral IP address pool. If you specify a static external IP address, it must live in the same region as the zone of the instance. | true | true | A static public IP makes the instance persistently reachable from the internet. This creates a direct and predictable attack surface. | access_configs block removed entirely | external_ip = "34.151.100.10" |

### confidential_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `confidential_instance_type` | Defines the type of technology used by the confidential instance. Possible values are: `SEV`. | false | true | Confidential VMs use AMD SEV to encrypt memory at runtime, protecting data-in-use from hypervisor-level attacks. Requires a compatible machine type (n2d-standard-*) and is incompatible with GPU accelerators. | confidential_instance_type = "SEV" | confidential_instance_config block omitted |

### reservation_affinity Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `consume_reservation_type` | Specifies the type of reservation from which this instance can consume resources: RESERVATION_ANY (default), RESERVATION_SPECIFIC, or RESERVATION_NONE. Possible values are: `RESERVATION_NONE`, `RESERVATION_ANY`, `RESERVATION_SPECIFIC`. | false | false | Controls capacity reservation scheduling. This is a resource management attribute with no security impact. | None | None |
| `key` | Corresponds to the label key of a reservation resource. To target a RESERVATION_SPECIFIC by name, use compute.googleapis.com/reservation-name as the key and specify the name of your reservation as its value. | false | false | Identifies the reservation label key. This is a resource management attribute with no security impact. | None | None |
| `values` | Corresponds to the label values of a reservation resource. This can be either a name to a reservation in the same project or "projects/different-project/reservations/some-reservation-name" to target a shared reservation in the same zone but in a different project. | false | false | Specifies the reservation label values. This is a resource management attribute with no security impact. | None | None |
