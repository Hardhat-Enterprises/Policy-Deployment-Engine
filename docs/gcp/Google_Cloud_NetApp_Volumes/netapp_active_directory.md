## 🛡️ Policy Deployment Engine: `netapp_active_directory`

This section provides a concise policy evaluation for the `netapp_active_directory` resource in GCP.

Reference: [Terraform Registry – netapp_active_directory](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_active_directory)

---

## 1. Argument Reference

### `domain`
- Description: (Required) Fully qualified domain name for the Active Directory domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns`
- Description: (Required) Comma separated list of DNS server IP addresses for the Active Directory domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `net_bios_prefix`
- Description: (Required) NetBIOS name prefix of the server to be created. A five-character random ID is generated automatically, for example, -6f9a, and appended to the prefix. The full UNC share path will have the following format: `\\NetBIOS_PREFIX-ABCD.DOMAIN_NAME\SHARE_NAME`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the Active Directory account with permissions to create the compute account within the specified organizational unit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) Password for specified username. Note - Manual changes done to the password will not be detected. Terraform will not re-apply the password, unless you use a new password in Terraform. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of the region for the policy to apply to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the Active Directory pool. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `site`
- Description: (Optional) Specifies an Active Directory site to manage domain controller selection. Use when Active Directory domain controllers in multiple regions are configured. Defaults to `Default-First-Site-Name` if left empty.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organizational_unit`
- Description: (Optional) Name of the Organizational Unit where you intend to create the computer account for NetApp Volumes. Defaults to `CN=Computers` if left empty.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aes_encryption`
- Description: (Optional) Enables AES-128 and AES-256 encryption for Kerberos-based communication with Active Directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_operators`
- Description: (Optional) Domain user/group accounts to be added to the Backup Operators group of the SMB service. The Backup Operators group allows members to backup and restore files regardless of whether they have read or write access to the files. Comma-separated list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `administrators`
- Description: (Optional) Domain user accounts to be added to the local Administrators group of the SMB service. Comma-separated list of domain users or groups. The Domain Admin group is automatically added when the service joins your domain as a hidden group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_operators`
- Description: (Optional) Domain accounts that require elevated privileges such as `SeSecurityPrivilege` to manage security logs. Comma-separated list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kdc_hostname`
- Description: (Optional) Hostname of the Active Directory server used as Kerberos Key Distribution Center. Only required for volumes using kerberized NFSv4.1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kdc_ip`
- Description: (Optional) IP address of the Active Directory server used as Kerberos Key Distribution Center.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfs_users_with_ldap`
- Description: (Optional) Local UNIX users on clients without valid user information in Active Directory are blocked from access to LDAP enabled volumes. This option can be used to temporarily switch such volumes to AUTH_SYS authentication (user ID + 1-16 groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ldap_signing`
- Description: (Optional) Specifies whether or not the LDAP traffic needs to be signed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encrypt_dc_connections`
- Description: (Optional) If enabled, traffic between the SMB server to Domain Controller (DC) will be encrypted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
