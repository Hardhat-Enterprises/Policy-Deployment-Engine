# Google Transcoder Job

## Resource Overview

`google_transcoder_job` is a Google Cloud Transcoder resource used to create video transcoding jobs. A transcoding job converts media files into different output formats, resolutions, bitrates, and streaming formats. The job can use either a predefined template through `template_id` or a custom `config` block.

This resource is important from a security and governance point of view because transcoding jobs process media files stored in Cloud Storage and may also use project, location, labels, Pub/Sub notifications, output paths, and encryption settings.

## Arguments Reviewed

The main arguments reviewed for policy creation were:

- `location`
- `project`
- `template_id`
- `labels`
- `config.inputs.uri`
- `config.output.uri`
- `config.pubsub_destination.topic`
- `config.encryptions.secret_manager_key_source.secret_version`

## Policies Implemented

### 1. allowed_location

**Argument:** `location`

**Policy Type:** Whitelist

**Allowed Value:**

```text
us-central1