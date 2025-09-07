## 🛡️ Policy Deployment Engine: `transcoder_job_template`

This section provides a concise policy evaluation for the `transcoder_job_template` resource in GCP.

Reference: [Terraform Registry – transcoder_job_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/transcoder_job_template)

---

## 1. Argument Reference

### `job_template_id`
- Description: (Required) ID to use for the Transcoding job template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the transcoding job template resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels associated with this job template. You can use these to organize and group your job templates. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) The configuration for this template. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inputs`
- Description: (Optional) List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_inputs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edit_list`
- Description: (Optional) List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_edit_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `elementary_streams`
- Description: (Optional) List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_elementary_streams).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mux_streams`
- Description: (Optional) Multiplexing settings for output stream. Structure is [documented below](#nested_config_mux_streams).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manifests`
- Description: (Optional) Manifest configuration. Structure is [documented below](#nested_config_manifests).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output`
- Description: (Optional) Location of output file(s) in a Cloud Storage bucket. Structure is [documented below](#nested_config_output).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ad_breaks`
- Description: (Optional) Ad break. Structure is [documented below](#nested_config_ad_breaks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_destination`
- Description: (Optional) Pub/Sub destination. Structure is [documented below](#nested_config_pubsub_destination).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overlays`
- Description: (Optional) List of overlays on the output video, in descending Z-order. Structure is [documented below](#nested_config_overlays).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryptions`
- Description: (Optional) List of encryption configurations for the content. Structure is [documented below](#nested_config_encryptions). <a name="nested_config_inputs"></a>The `inputs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) A unique key for this input. Must be specified when using advanced mapping and edit lists.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) URI of the media. Input files must be at least 5 seconds in duration and stored in Cloud Storage (for example, gs://bucket/inputs/file.mp4). If empty, the value is populated from Job.input_uri. <a name="nested_config_edit_list"></a>The `edit_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) A unique key for this atom.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inputs`
- Description: (Optional) List of values identifying files that should be used in this atom.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time_offset`
- Description: (Optional) Start time in seconds for the atom, relative to the input file timeline.  The default is `0s`. <a name="nested_config_elementary_streams"></a>The `elementary_streams` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) A unique key for this atom.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `video_stream`
- Description: (Optional) Encoding of a video stream. Structure is [documented below](#nested_config_elementary_streams_elementary_streams_video_stream).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audio_stream`
- Description: (Optional) Encoding of an audio stream. Structure is [documented below](#nested_config_elementary_streams_elementary_streams_audio_stream). <a name="nested_config_elementary_streams_elementary_streams_video_stream"></a>The `video_stream` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `h264`
- Description: (Optional) H264 codec settings Structure is [documented below](#nested_config_elementary_streams_elementary_streams_video_stream_h264). <a name="nested_config_elementary_streams_elementary_streams_video_stream_h264"></a>The `h264` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `width_pixels`
- Description: (Optional) The width of the video in pixels.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `height_pixels`
- Description: (Optional) The height of the video in pixels.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frame_rate`
- Description: (Required) The target video frame rate in frames per second (FPS).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitrate_bps`
- Description: (Required) The video bitrate in bits per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pixel_format`
- Description: (Optional) Pixel format to use. The default is `yuv420p`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rate_control_mode`
- Description: (Optional) Specify the mode. The default is `vbr`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crf_level`
- Description: (Optional) Target CRF level. The default is `21`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vbv_size_bits`
- Description: (Optional) Size of the Video Buffering Verifier (VBV) buffer in bits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vbv_fullness_bits`
- Description: (Optional) Initial fullness of the Video Buffering Verifier (VBV) buffer in bits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entropy_coder`
- Description: (Optional) The entropy coder to use. The default is `cabac`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profile`
- Description: (Optional) Enforces the specified codec profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preset`
- Description: (Optional) Enforces the specified codec preset. The default is `veryfast`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gop_duration`
- Description: (Optional) Select the GOP size based on the specified duration. The default is `3s`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sdr`
- Description: (Optional) SDR color format setting for H264.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hlg`
- Description: (Optional) HLG color format setting for H264. <a name="nested_config_elementary_streams_elementary_streams_audio_stream"></a>The `audio_stream` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `codec`
- Description: (Optional) The codec for this audio stream. The default is `aac`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitrate_bps`
- Description: (Required) Audio bitrate in bits per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel_count`
- Description: (Optional) Number of audio channels. The default is `2`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel_layout`
- Description: (Optional) A list of channel names specifying layout of the audio channels.  The default is ["fl", "fr"].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_rate_hertz`
- Description: (Optional) The audio sample rate in Hertz. The default is `48000`. <a name="nested_config_mux_streams"></a>The `mux_streams` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) A unique key for this multiplexed stream.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_name`
- Description: (Optional) The name of the generated file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container`
- Description: (Optional) The container format. The default is `mp4`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `elementary_streams`
- Description: (Optional) List of ElementaryStream.key values multiplexed in this stream.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `segment_settings`
- Description: (Optional) Segment settings for ts, fmp4 and vtt. Structure is [documented below](#nested_config_mux_streams_mux_streams_segment_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_id`
- Description: (Optional) Identifier of the encryption configuration to use. <a name="nested_config_mux_streams_mux_streams_segment_settings"></a>The `segment_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `segment_duration`
- Description: (Optional) Duration of the segments in seconds. The default is `6.0s`. <a name="nested_config_manifests"></a>The `manifests` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_name`
- Description: (Optional) The name of the generated file. The default is `manifest`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of the manifest. Possible values are: `MANIFEST_TYPE_UNSPECIFIED`, `HLS`, `DASH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mux_streams`
- Description: (Optional) List of user supplied MuxStream.key values that should appear in this manifest. <a name="nested_config_output"></a>The `output` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) URI for the output file(s). For example, gs://my-bucket/outputs/. <a name="nested_config_ad_breaks"></a>The `ad_breaks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time_offset`
- Description: (Optional) Start time in seconds for the ad break, relative to the output file timeline <a name="nested_config_pubsub_destination"></a>The `pubsub_destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Optional) The name of the Pub/Sub topic to publish job completion notification to. For example: projects/{project}/topics/{topic}. <a name="nested_config_overlays"></a>The `overlays` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) Image overlay. Structure is [documented below](#nested_config_overlays_overlays_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `animations`
- Description: (Optional) List of animations. The list should be chronological, without any time overlap. Structure is [documented below](#nested_config_overlays_overlays_animations). <a name="nested_config_overlays_overlays_image"></a>The `image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) URI of the image in Cloud Storage. For example, gs://bucket/inputs/image.png. <a name="nested_config_overlays_overlays_animations"></a>The `animations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `animation_fade`
- Description: (Optional) Display overlay object with fade animation. Structure is [documented below](#nested_config_overlays_overlays_animations_animations_animation_fade). <a name="nested_config_overlays_overlays_animations_animations_animation_fade"></a>The `animation_fade` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `xy`
- Description: (Optional) Normalized coordinates based on output video resolution. Structure is [documented below](#nested_config_overlays_overlays_animations_animations_animation_fade_xy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time_offset`
- Description: (Optional) The time to start the fade animation, in seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time_offset`
- Description: (Optional) The time to end the fade animation, in seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fade_type`
- Description: (Required) Required. Type of fade animation: `FADE_IN` or `FADE_OUT`. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `x`
- Description: (Optional) Normalized x coordinate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `y`
- Description: (Optional) Normalized y coordinate. <a name="nested_config_encryptions"></a>The `encryptions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Identifier for this set of encryption options.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `drm_systems`
- Description: (Optional) DRM system(s) to use; at least one must be specified. If a DRM system is omitted, it is considered disabled. Structure is [documented below](#nested_config_encryptions_encryptions_drm_systems).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aes128`
- Description: (Optional) Configuration for AES-128 encryption.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_aes`
- Description: (Optional) Configuration for SAMPLE-AES encryption.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mpeg_cenc`
- Description: (Optional) Configuration for MPEG Common Encryption (MPEG-CENC). Structure is [documented below](#nested_config_encryptions_encryptions_mpeg_cenc).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_key_source`
- Description: (Optional) Configuration for secrets stored in Google Secret Manager. Structure is [documented below](#nested_config_encryptions_encryptions_secret_manager_key_source). <a name="nested_config_encryptions_encryptions_drm_systems"></a>The `drm_systems` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `widevine`
- Description: (Optional) Widevine configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fairplay`
- Description: (Optional) Fairplay configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `playready`
- Description: (Optional) Playready configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `clearkey`
- Description: (Optional) Clearkey configuration. <a name="nested_config_encryptions_encryptions_mpeg_cenc"></a>The `mpeg_cenc` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheme`
- Description: (Required) Specify the encryption scheme. <a name="nested_config_encryptions_encryptions_secret_manager_key_source"></a>The `secret_manager_key_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The name of the Secret Version containing the encryption key in the following format: projects/{project}/secrets/{secret_id}/versions/{version_number}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
