package terraform.gcp.security.analytics_hub.data_exchange_subscription

variables := {
    "friendly_resource_name": "BigQuery Analytics Hub Data Exchange Subscription",
    "resource_type": "google_bigquery_analytics_hub_data_exchange_subscription",
    "resource_value_name": "subscription_id",
    "allowed_regions": ["us"],
    "allowed_refresh_policies": ["ON_READ", "ON_STALE"]
}
