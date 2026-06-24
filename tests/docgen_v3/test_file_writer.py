"""Unit tests for document assembly and refresh merge."""

import json
import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v3.lib import file_writer


def test_build_document_key_order():
    doc = file_writer.build_document({"a": {}}, "7.37.0", last_updated="2026-06-23T00:00:00Z")
    assert list(doc.keys()) == ["last_updated", "provider_version", "arguments"]
    assert doc["provider_version"] == "7.37.0"


def test_target_path_is_verbatim(tmp_path):
    p = file_writer.target_path(tmp_path, "gcp", "Cloud Storage", "google_storage_bucket")
    assert p == tmp_path / "gcp" / "Cloud Storage" / "google_storage_bucket.json"


def test_target_path_sanitizes_slash(tmp_path):
    # "Cloud Pub/Sub" must become a single folder, not a nested one
    p = file_writer.target_path(tmp_path, "gcp", "Cloud Pub/Sub", "google_pubsub_topic")
    assert p == tmp_path / "gcp" / "Cloud Pub__Sub" / "google_pubsub_topic.json"
    assert file_writer.sanitize_service("Cloud Pub/Sub") == "Cloud Pub__Sub"
    assert file_writer.sanitize_service("Cloud Storage") == "Cloud Storage"  # unchanged


def test_write_and_load_roundtrip(tmp_path):
    path = tmp_path / "gcp" / "Cloud Storage" / "google_storage_bucket.json"
    doc = file_writer.build_document({"name": {"description": "", "required": True,
                                              "type": "string", "security_impact": "true/false",
                                              "rationale": ""}}, "7.37.0")
    file_writer.write_document(path, doc)
    assert path.read_text().endswith("\n")
    loaded = file_writer.load_document(path)
    assert loaded["arguments"]["name"]["type"] == "string"


def _leaf(si="true/false", rat=""):
    return {"description": "", "required": False, "type": "string",
            "security_impact": si, "rationale": rat}


def test_merge_preserves_human_authored_fields():
    new = {"location": _leaf(), "name": _leaf()}
    existing = {
        "location": _leaf(si="true", rat="must be in AU"),
        "name": _leaf(),  # untouched defaults -> nothing to preserve
    }
    merged = file_writer.merge_preserving_human_fields(new, existing)
    assert merged["location"]["security_impact"] == "true"
    assert merged["location"]["rationale"] == "must be in AU"
    assert merged["name"]["security_impact"] == "true/false"


def test_merge_drops_removed_and_keeps_new_args():
    new = {"keep": _leaf(), "brand_new": _leaf()}
    existing = {"keep": _leaf(si="x"), "gone": _leaf(si="y", rat="stale")}
    merged = file_writer.merge_preserving_human_fields(new, existing)
    assert set(merged.keys()) == {"keep", "brand_new"}   # 'gone' dropped
    assert merged["keep"]["security_impact"] == "x"       # preserved
    assert merged["brand_new"]["security_impact"] == "true/false"


def test_merge_ignores_blocks():
    new = {"blk": {"type": "block", "description": "", "required": False}}
    existing = {"blk": {"type": "block", "description": "old", "required": True}}
    merged = file_writer.merge_preserving_human_fields(new, existing)
    assert merged["blk"] == {"type": "block", "description": "", "required": False}
