## 🛡️ Policy Deployment Engine: `vertex_ai_featurestore_entitytype`

This section provides a concise policy evaluation for the `vertex_ai_featurestore_entitytype` resource in GCP.

Reference: [Terraform Registry – vertex_ai_featurestore_entitytype](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_featurestore_entitytype)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `featurestore` | The name of the Featurestore to use, in the format projects/{project}/locations/{location}/featurestores/{featurestore}. | true | None | None |
| `name` | The name of the EntityType. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number. | false | None | None |
| `description` | Optional. Description of the EntityType. | false | None | None |
| `labels` | A set of key/value label pairs to assign to this EntityType. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `offline_storage_ttl_days` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Config for data retention policy in offline storage. TTL in days for feature values that will be stored in offline storage. The Feature Store offline storage periodically removes obsolete feature values older than offlineStorageTtlDays since the feature generation time. If unset (or explicitly set to 0), default to 4000 days TTL. | false | None | None |

### monitoring_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `snapshot_analysis` | The config for Snapshot Analysis Based Feature Monitoring. Structure is [documented below](#nested_monitoring_config_snapshot_analysis). | false | None | None |
| `import_features_analysis` | The config for ImportFeatures Analysis Based Feature Monitoring. Structure is [documented below](#nested_monitoring_config_import_features_analysis). | false | None | None |
| `numerical_threshold_config` | Threshold for numerical features of anomaly detection. This is shared by all objectives of Featurestore Monitoring for numerical features (i.e. Features with type (Feature.ValueType) DOUBLE or INT64). Structure is [documented below](#nested_monitoring_config_numerical_threshold_config). | false | None | None |
| `categorical_threshold_config` | Threshold for categorical features of anomaly detection. This is shared by all types of Featurestore Monitoring for categorical features (i.e. Features with type (Feature.ValueType) BOOL or STRING). Structure is [documented below](#nested_monitoring_config_categorical_threshold_config). | false | None | None |

### snapshot_analysis Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled` | The monitoring schedule for snapshot analysis. For EntityType-level config: unset / disabled = true indicates disabled by default for Features under it; otherwise by default enable snapshot analysis monitoring with monitoringInterval for Features under it. | false | None | None |
| `monitoring_interval` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) Configuration of the snapshot analysis based monitoring pipeline running interval. The value is rolled up to full day. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". ~> **Warning:** `monitoring_interval` is deprecated and will be removed in a future release. | false | None | None |
| `monitoring_interval_days` | Configuration of the snapshot analysis based monitoring pipeline running interval. The value indicates number of days. The default value is 1. If both FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days and [FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval][] are set when creating/updating EntityTypes/Features, FeaturestoreMonitoringConfig.SnapshotAnalysis.monitoring_interval_days will be used. | false | None | None |
| `staleness_days` | Customized export features time window for snapshot analysis. Unit is one day. The default value is 21 days. Minimum value is 1 day. Maximum value is 4000 days. | false | None | None |

### import_features_analysis Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | Whether to enable / disable / inherite default hebavior for import features analysis. The value must be one of the values below: * DEFAULT: The default behavior of whether to enable the monitoring. EntityType-level config: disabled. * ENABLED: Explicitly enables import features analysis. EntityType-level config: by default enables import features analysis for all Features under it. * DISABLED: Explicitly disables import features analysis. EntityType-level config: by default disables import features analysis for all Features under it. | false | None | None |
| `anomaly_detection_baseline` | Defines the baseline to do anomaly detection for feature values imported by each [entityTypes.importFeatureValues][] operation. The value must be one of the values below: * LATEST_STATS: Choose the later one statistics generated by either most recent snapshot analysis or previous import features analysis. If non of them exists, skip anomaly detection and only generate a statistics. * MOST_RECENT_SNAPSHOT_STATS: Use the statistics generated by the most recent snapshot analysis if exists. * PREVIOUS_IMPORT_FEATURES_STATS: Use the statistics generated by the previous import features analysis if exists. | false | None | None |

### numerical_threshold_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | Specify a threshold value that can trigger the alert. For numerical feature, the distribution distance is calculated by Jensen–Shannon divergence. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3. | true | None | None |

### categorical_threshold_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | Specify a threshold value that can trigger the alert. For categorical feature, the distribution distance is calculated by L-inifinity norm. Each feature must have a non-zero threshold if they need to be monitored. Otherwise no alert will be triggered for that feature. The default value is 0.3. | true | None | None |
