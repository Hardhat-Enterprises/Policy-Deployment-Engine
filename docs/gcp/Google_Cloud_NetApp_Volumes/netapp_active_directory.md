## 🛡️ Policy Deployment Engine: `netapp_active_directory`

This section provides a concise policy evaluation for the `netapp_active_directory` resource in GCP.

Reference: [Terraform Registry – netapp_active_directory](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_active_directory)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Fully qualified domain name for the Active Directory domain. | true | None | None |
| `dns` | Comma separated list of DNS server IP addresses for the Active Directory domain. | true | None | None |
| `net_bios_prefix` | NetBIOS name prefix of the server to be created. A five-character random ID is generated automatically, for example, -6f9a, and appended to the prefix. The full UNC share path will have the following format: `\\NetBIOS_PREFIX-ABCD.DOMAIN_NAME\SHARE_NAME` | true | None | None |
| `username` | Username for the Active Directory account with permissions to create the compute account within the specified organizational unit. | true | None | None |
| `password` | Password for specified username. Note - Manual changes done to the password will not be detected. Terraform will not re-apply the password, unless you use a new password in Terraform. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `location` | Name of the region for the policy to apply to. | true | None | None |
| `name` | The resource name of the Active Directory pool. Needs to be unique per location. | true | None | None |
| `site` | Specifies an Active Directory site to manage domain controller selection. Use when Active Directory domain controllers in multiple regions are configured. Defaults to `Default-First-Site-Name` if left empty. | false | None | None |
| `organizational_unit` | Name of the Organizational Unit where you intend to create the computer account for NetApp Volumes. Defaults to `CN=Computers` if left empty. | false | None | None |
| `aes_encryption` | Enables AES-128 and AES-256 encryption for Kerberos-based communication with Active Directory. | false | None | None |
| `backup_operators` | Domain user/group accounts to be added to the Backup Operators group of the SMB service. The Backup Operators group allows members to backup and restore files regardless of whether they have read or write access to the files. Comma-separated list. | false | None | None |
| `administrators` | Domain user accounts to be added to the local Administrators group of the SMB service. Comma-separated list of domain users or groups. The Domain Admin group is automatically added when the service joins your domain as a hidden group. | false | None | None |
| `security_operators` | Domain accounts that require elevated privileges such as `SeSecurityPrivilege` to manage security logs. Comma-separated list. | false | None | None |
| `kdc_hostname` | Hostname of the Active Directory server used as Kerberos Key Distribution Center. Only required for volumes using kerberized NFSv4.1 | false | None | None |
| `kdc_ip` | IP address of the Active Directory server used as Kerberos Key Distribution Center. | false | None | None |
| `nfs_users_with_ldap` | Local UNIX users on clients without valid user information in Active Directory are blocked from access to LDAP enabled volumes. This option can be used to temporarily switch such volumes to AUTH_SYS authentication (user ID + 1-16 groups). | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `ldap_signing` | Specifies whether or not the LDAP traffic needs to be signed. | false | None | None |
| `encrypt_dc_connections` | If enabled, traffic between the SMB server to Domain Controller (DC) will be encrypted. | false | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
