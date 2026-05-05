# Google Transcoder Job Template

## Resource Overview

`google_transcoder_job_template` is a Google Cloud Transcoder resource used to define reusable transcoding configurations. A job template can include input definitions, output settings, elementary streams, mux streams, manifests, overlays, Pub/Sub destinations, and encryption settings.

This resource is important from a security and governance point of view because templates can be reused by multiple transcoding jobs. If a template is misconfigured, the same unsafe configuration may be reused across many jobs.

## Arguments Reviewed

The main arguments reviewed for policy creation were:

- `job_template_id`
- `location`
- `project`
- `labels`
- `config.inputs.uri`
- `config.output.uri`
- `config.pubsub_destination.topic`
- `config.encryptions.secret_manager_key_source.secret_version`
- `config.manifests.type`

## Policies Implemented

### 1. allowed_location

**Argument:** `location`

**Policy Type:** Whitelist

**Allowed Value:**

```text
us-central1