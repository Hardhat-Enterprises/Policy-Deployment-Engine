## 🛡️ Policy Deployment Engine: `netapp_active_directory`

This section provides a concise policy evaluation for the `netapp_active_directory` resource in GCP.

Reference: [Terraform Registry – netapp_active_directory](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_active_directory)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Fully qualified domain name for the Active Directory domain. | true | true | Ensures join operations target the trusted domain. | deakin.internal | ad.internal |
| `dns` | DNS server IPs for the AD domain. (If your policy whitelists a single resolver, enforce that value.) | true | true | Forces lookups to approved internal resolvers; prevents leakage to public DNS. | 10.10.0.10 | 8.8.8.8 |
| `net_bios_prefix` | NetBIOS name prefix of the server to be created. A five-character random ID is generated automatically, for example, -6f9a, and appended to the prefix. The full UNC share path will have the following format: `\\NetBIOS_PREFIX-ABCD.DOMAIN_NAME\SHARE_NAME` | true | false | None | None | None |
| `username` | AD account with rights to join/create the computer account in the specified OU. | true | true | Prevents use of built-in/admin accounts; enforces least privilege. | svc_netapp_joiner@deakin.internal | admin |
| `password` | Password for the join account (store as a sensitive variable, not in VCS). | true | true | Strong secrets reduce compromise risk; avoid weak/common values. | Deakin!2025#NetApp | pass |
| `location` | Name of the region for the policy to apply to. | true | false | None | None | None |
| `name` | The resource name of the Active Directory pool. Needs to be unique per location. | true | false | None | None | None |
| `site` | Specifies an Active Directory site to manage domain controller selection. Use when Active Directory domain controllers in multiple regions are configured. Defaults to `Default-First-Site-Name` if left empty. | false | false | None | None | None |
| `organizational_unit` | Name of the Organizational Unit where you intend to create the computer account for NetApp Volumes. Defaults to `CN=Computers` if left empty. | false | false | None | None | None |
| `aes_encryption` | Enables AES-128 and AES-256 encryption for Kerberos-based communication with Active Directory. | false | false | None | None | None |
| `backup_operators` | Domain user/group accounts to be added to the Backup Operators group of the SMB service. The Backup Operators group allows members to backup and restore files regardless of whether they have read or write access to the files. Comma-separated list. | false | false | None | None | None |
| `administrators` | Domain user accounts to be added to the local Administrators group of the SMB service. Comma-separated list of domain users or groups. The Domain Admin group is automatically added when the service joins your domain as a hidden group. | false | false | None | None | None |
| `security_operators` | Domain accounts that require elevated privileges such as `SeSecurityPrivilege` to manage security logs. Comma-separated list. | false | false | None | None | None |
| `kdc_hostname` | Hostname of the Active Directory server used as Kerberos Key Distribution Center. Only required for volumes using kerberized NFSv4.1 | false | false | None | None | None |
| `kdc_ip` | IP address of the Active Directory server used as Kerberos Key Distribution Center. | false | false | None | None | None |
| `nfs_users_with_ldap` | Local UNIX users on clients without valid user information in Active Directory are blocked from access to LDAP enabled volumes. This option can be used to temporarily switch such volumes to AUTH_SYS authentication (user ID + 1-16 groups). | false | false | None | None | None |
| `description` | An optional description of this resource. | false | false | None | None | None |
| `ldap_signing` | Specifies whether or not the LDAP traffic needs to be signed. | false | false | None | None | None |
| `encrypt_dc_connections` | If enabled, traffic between the SMB server to Domain Controller (DC) will be encrypted. | false | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
