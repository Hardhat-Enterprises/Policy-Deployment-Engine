## 🛡️ Policy Deployment Engine: `transcoder_job_template`

This section provides a concise policy evaluation for the `transcoder_job_template` resource in GCP.

Reference: [Terraform Registry – transcoder_job_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/transcoder_job_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `job_template_id` | ID to use for the Transcoding job template. | true | None | None |
| `location` | The location of the transcoding job template resource. | true | None | None |
| `labels` | The labels associated with this job template. You can use these to organize and group your job templates. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `inputs` | List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_inputs). | false | None | None |
| `edit_list` | List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_edit_list). | false | None | None |
| `elementary_streams` | List of input assets stored in Cloud Storage. Structure is [documented below](#nested_config_elementary_streams). | false | None | None |
| `mux_streams` | Multiplexing settings for output stream. Structure is [documented below](#nested_config_mux_streams). | false | None | None |
| `manifests` | Manifest configuration. Structure is [documented below](#nested_config_manifests). | false | None | None |
| `output` | Location of output file(s) in a Cloud Storage bucket. Structure is [documented below](#nested_config_output). | false | None | None |
| `ad_breaks` | Ad break. Structure is [documented below](#nested_config_ad_breaks). | false | None | None |
| `pubsub_destination` | Pub/Sub destination. Structure is [documented below](#nested_config_pubsub_destination). | false | None | None |
| `overlays` | List of overlays on the output video, in descending Z-order. Structure is [documented below](#nested_config_overlays). | false | None | None |
| `encryptions` | List of encryption configurations for the content. Structure is [documented below](#nested_config_encryptions). | false | None | None |

### inputs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | A unique key for this input. Must be specified when using advanced mapping and edit lists. | false | None | None |
| `uri` | URI of the media. Input files must be at least 5 seconds in duration and stored in Cloud Storage (for example, gs://bucket/inputs/file.mp4). If empty, the value is populated from Job.input_uri. | false | None | None |

### edit_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | A unique key for this atom. | false | None | None |
| `inputs` | List of values identifying files that should be used in this atom. | false | None | None |
| `start_time_offset` | Start time in seconds for the atom, relative to the input file timeline.  The default is `0s`. | false | None | None |

### elementary_streams Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | A unique key for this atom. | false | None | None |
| `video_stream` | Encoding of a video stream. Structure is [documented below](#nested_config_elementary_streams_elementary_streams_video_stream). | false | None | None |
| `audio_stream` | Encoding of an audio stream. Structure is [documented below](#nested_config_elementary_streams_elementary_streams_audio_stream). | false | None | None |

### video_stream Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `h264` | H264 codec settings Structure is [documented below](#nested_config_elementary_streams_elementary_streams_video_stream_h264). | false | None | None |

### h264 Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `width_pixels` | The width of the video in pixels. | false | None | None |
| `height_pixels` | The height of the video in pixels. | false | None | None |
| `frame_rate` | The target video frame rate in frames per second (FPS). | true | None | None |
| `bitrate_bps` | The video bitrate in bits per second. | true | None | None |
| `pixel_format` | Pixel format to use. The default is `yuv420p`. | false | None | None |
| `rate_control_mode` | Specify the mode. The default is `vbr`. | false | None | None |
| `crf_level` | Target CRF level. The default is `21`. | false | None | None |
| `vbv_size_bits` | Size of the Video Buffering Verifier (VBV) buffer in bits. | false | None | None |
| `vbv_fullness_bits` | Initial fullness of the Video Buffering Verifier (VBV) buffer in bits. | false | None | None |
| `entropy_coder` | The entropy coder to use. The default is `cabac`. | false | None | None |
| `profile` | Enforces the specified codec profile. | false | None | None |
| `preset` | Enforces the specified codec preset. The default is `veryfast`. | false | None | None |
| `gop_duration` | Select the GOP size based on the specified duration. The default is `3s`. | false | None | None |
| `sdr` | SDR color format setting for H264. | false | None | None |
| `hlg` | HLG color format setting for H264. | false | None | None |

### audio_stream Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `codec` | The codec for this audio stream. The default is `aac`. | false | None | None |
| `bitrate_bps` | Audio bitrate in bits per second. | true | None | None |
| `channel_count` | Number of audio channels. The default is `2`. | false | None | None |
| `channel_layout` | A list of channel names specifying layout of the audio channels.  The default is ["fl", "fr"]. | false | None | None |
| `sample_rate_hertz` | The audio sample rate in Hertz. The default is `48000`. | false | None | None |

### mux_streams Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | A unique key for this multiplexed stream. | false | None | None |
| `file_name` | The name of the generated file. | false | None | None |
| `container` | The container format. The default is `mp4`. | false | None | None |
| `elementary_streams` | List of ElementaryStream.key values multiplexed in this stream. | false | None | None |
| `segment_settings` | Segment settings for ts, fmp4 and vtt. Structure is [documented below](#nested_config_mux_streams_mux_streams_segment_settings). | false | None | None |
| `encryption_id` | Identifier of the encryption configuration to use. | false | None | None |

### segment_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `segment_duration` | Duration of the segments in seconds. The default is `6.0s`. | false | None | None |

### manifests Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file_name` | The name of the generated file. The default is `manifest`. | false | None | None |
| `type` | Type of the manifest. Possible values are: `MANIFEST_TYPE_UNSPECIFIED`, `HLS`, `DASH`. | true | None | None |
| `mux_streams` | List of user supplied MuxStream.key values that should appear in this manifest. | false | None | None |

### output Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | URI for the output file(s). For example, gs://my-bucket/outputs/. | false | None | None |

### ad_breaks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time_offset` | Start time in seconds for the ad break, relative to the output file timeline | false | None | None |

### pubsub_destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | The name of the Pub/Sub topic to publish job completion notification to. For example: projects/{project}/topics/{topic}. | false | None | None |

### overlays Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image` | Image overlay. Structure is [documented below](#nested_config_overlays_overlays_image). | false | None | None |
| `animations` | List of animations. The list should be chronological, without any time overlap. Structure is [documented below](#nested_config_overlays_overlays_animations). | false | None | None |

### image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | URI of the image in Cloud Storage. For example, gs://bucket/inputs/image.png. | true | None | None |

### animations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `animation_fade` | Display overlay object with fade animation. Structure is [documented below](#nested_config_overlays_overlays_animations_animations_animation_fade). | false | None | None |

### animation_fade Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `xy` | Normalized coordinates based on output video resolution. Structure is [documented below](#nested_config_overlays_overlays_animations_animations_animation_fade_xy). | false | None | None |
| `start_time_offset` | The time to start the fade animation, in seconds. | false | None | None |
| `end_time_offset` | The time to end the fade animation, in seconds. | false | None | None |
| `fade_type` | Required. Type of fade animation: `FADE_IN` or `FADE_OUT`. The possible values are: * `FADE_TYPE_UNSPECIFIED`: The fade type is not specified. * `FADE_IN`: Fade the overlay object into view. * `FADE_OUT`: Fade the overlay object out of view. Possible values are: `FADE_TYPE_UNSPECIFIED`, `FADE_IN`, `FADE_OUT`. | true | None | None |

### xy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `x` | Normalized x coordinate. | false | None | None |
| `y` | Normalized y coordinate. | false | None | None |

### encryptions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Identifier for this set of encryption options. | true | None | None |
| `drm_systems` | DRM system(s) to use; at least one must be specified. If a DRM system is omitted, it is considered disabled. Structure is [documented below](#nested_config_encryptions_encryptions_drm_systems). | false | None | None |
| `aes128` | Configuration for AES-128 encryption. | false | None | None |
| `sample_aes` | Configuration for SAMPLE-AES encryption. | false | None | None |
| `mpeg_cenc` | Configuration for MPEG Common Encryption (MPEG-CENC). Structure is [documented below](#nested_config_encryptions_encryptions_mpeg_cenc). | false | None | None |
| `secret_manager_key_source` | Configuration for secrets stored in Google Secret Manager. Structure is [documented below](#nested_config_encryptions_encryptions_secret_manager_key_source). | false | None | None |

### drm_systems Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `widevine` | Widevine configuration. | false | None | None |
| `fairplay` | Fairplay configuration. | false | None | None |
| `playready` | Playready configuration. | false | None | None |
| `clearkey` | Clearkey configuration. | false | None | None |

### mpeg_cenc Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scheme` | Specify the encryption scheme. | true | None | None |

### secret_manager_key_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The name of the Secret Version containing the encryption key in the following format: projects/{project}/secrets/{secret_id}/versions/{version_number}. | true | None | None |
