## 🛡️ Policy Deployment Engine: `spanner_backup_schedule`

This section provides a concise policy evaluation for the `spanner_backup_schedule` resource in GCP.

Reference: [Terraform Registry – spanner_backup_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_backup_schedule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention_duration` | At what relative time in the future, compared to its creation time, the backup should be deleted, e.g. keep backups for 7 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: '3.5s'. You can set this to a value up to 366 days. | true | false | None | None | None |
| `instance` | The instance to create the database on. | true | false | None | None | None |
| `database` | The database to create the backup schedule on. | true | false | None | None | None |
| `name` | A unique identifier for the backup schedule, which cannot be changed after the backup schedule is created. Values are of the form [a-z][-a-z0-9]*[a-z0-9]. | false | false | None | None | None |
| `spec` | Defines specifications of the backup schedule. Structure is [documented below](#nested_spec). | false | false | None | None | None |
| `full_backup_spec` | The schedule creates only full backups.. | false | false | None | None | None |
| `incremental_backup_spec` | The schedule creates incremental backup chains. | false | false | None | None | None |
| `encryption_config` | Configuration for the encryption of the backup schedule. Structure is [documented below](#nested_encryption_config). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `cron_spec` |  | false | false | None | None | None |

### spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cron_spec` | Cron style schedule specification.. Structure is [documented below](#nested_spec_cron_spec). | false | false | None | None | None |

### encryption_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `encryption_type` | The encryption type of backups created by the backup schedule. Possible values are USE_DATABASE_ENCRYPTION, GOOGLE_DEFAULT_ENCRYPTION, or CUSTOMER_MANAGED_ENCRYPTION. If you use CUSTOMER_MANAGED_ENCRYPTION, you must specify a kmsKeyName. If your backup type is incremental-backup, the encryption type must be GOOGLE_DEFAULT_ENCRYPTION. Possible values are: `USE_DATABASE_ENCRYPTION`, `GOOGLE_DEFAULT_ENCRYPTION`, `CUSTOMER_MANAGED_ENCRYPTION`. | true | false | None | None | None |
| `kms_key_name` | The resource name of the Cloud KMS key to use for encryption. Format: 'projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}' | false | false | None | None | None |
| `kms_key_names` | Fully qualified name of the KMS keys to use to encrypt this database. The keys must exist in the same locations as the Spanner Database. | false | false | None | None | None |

### cron_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `text` | Textual representation of the crontab. User can customize the backup frequency and the backup version time using the cron expression. The version time must be in UTC timzeone. The backup will contain an externally consistent copy of the database at the version time. Allowed frequencies are 12 hour, 1 day, 1 week and 1 month. Examples of valid cron specifications: 0 2/12 * * * : every 12 hours at (2, 14) hours past midnight in UTC. 0 2,14 * * * : every 12 hours at (2,14) hours past midnight in UTC. 0 2 * * *    : once a day at 2 past midnight in UTC. 0 2 * * 0    : once a week every Sunday at 2 past midnight in UTC. 0 2 8 * *    : once a month on 8th day at 2 past midnight in UTC. | false | false | None | None | None |
