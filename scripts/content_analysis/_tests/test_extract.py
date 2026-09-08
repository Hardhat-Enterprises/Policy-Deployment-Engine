"""Unit tests for scripts/content_analysis/extract.py."""

import sys
from pathlib import Path

project_root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(project_root))

from scripts.content_analysis import extract


def _registry():
    return {"content_types": [
        {"name": "python", "attribute_keys": ["python_code"],
         "analyzer": "bandit", "command": ["bandit", "-f", "json", "{file}"]}
    ]}


def test_attribute_key_map():
    assert extract.attribute_key_map(_registry()) == {"python_code": "python"}


def test_extract_list_of_blocks_with_index():
    plan = {
        "planned_values": {"root_module": {"resources": [
            {"type": "google_ces_agent", "name": "agent_1", "values": {
                "after_agent_callbacks": [
                    {"description": "a", "python_code": "print(1)"},
                    {"description": "b", "python_code": "print(2)"},
                ]
            }},
        ]}},
    }
    results = extract.extract(plan, extract.attribute_key_map(_registry()))
    assert len(results) == 2
    assert results[0]["attribute_path"] == ["after_agent_callbacks", 0, "python_code"]
    assert results[1]["attribute_path"] == ["after_agent_callbacks", 1, "python_code"]
    assert all(r["language"] == "python" for r in results)


def test_extract_single_block():
    plan = {
        "planned_values": {"root_module": {"resources": [
            {"type": "google_ces_tool", "name": "tool_1", "values": {
                "python_function": {"name": "f", "python_code": "def f(): return 1"}
            }},
        ]}},
    }
    results = extract.extract(plan, extract.attribute_key_map(_registry()))
    assert len(results) == 1
    assert results[0]["attribute_path"] == ["python_function", "python_code"]


def test_extract_skips_empty_string():
    plan = {
        "planned_values": {"root_module": {"resources": [
            {"type": "google_ces_agent", "name": "agent_1", "values": {
                "after_agent_callbacks": [{"python_code": ""}]
            }},
        ]}},
    }
    assert extract.extract(plan, extract.attribute_key_map(_registry())) == []


def test_extract_ignores_unregistered_keys():
    plan = {
        "planned_values": {"root_module": {"resources": [
            {"type": "google_ces_agent", "name": "agent_1", "values": {
                "description": "not code"
            }},
        ]}},
    }
    assert extract.extract(plan, extract.attribute_key_map(_registry())) == []
