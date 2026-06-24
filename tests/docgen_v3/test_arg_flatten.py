"""Unit tests for the schema -> dotted-key arguments flattener."""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen_v3.lib.arg_flatten import flatten_arguments, render_type


def test_render_type_scalars_and_collections():
    assert render_type("string") == "string"
    assert render_type("bool") == "bool"
    assert render_type(["map", "string"]) == "map(string)"
    assert render_type(["set", "string"]) == "set(string)"
    assert render_type(["list", ["object", {"a": "string"}]]) == "list(object)"
    assert render_type(["object", {"a": "string"}]) == "object"


def _block(attributes=None, block_types=None):
    return {"attributes": attributes or {}, "block_types": block_types or {}}


def test_leaf_shape_and_field_order():
    block = _block(attributes={
        "name": {"type": "string", "required": True, "description": "The name."},
    })
    args = flatten_arguments(block)
    assert list(args["name"].keys()) == [
        "description", "required", "type", "security_impact", "rationale",
    ]
    assert args["name"] == {
        "description": "The name.", "required": True, "type": "string",
        "security_impact": "true/false", "rationale": "",
    }


def test_optional_attribute_required_false():
    block = _block(attributes={"x": {"type": "bool", "optional": True}})
    assert flatten_arguments(block)["x"]["required"] is False


def test_computed_only_attribute_is_excluded():
    block = _block(attributes={
        "self_link": {"type": "string", "computed": True},
        "size": {"type": "number", "optional": True, "computed": True},
    })
    args = flatten_arguments(block)
    assert "self_link" not in args      # pure computed -> dropped
    assert "size" in args               # optional+computed -> kept (user-settable)


def test_top_level_meta_excluded():
    block = _block(
        attributes={"id": {"type": "string", "optional": True, "computed": True}},
        block_types={"timeouts": {"nesting_mode": "single", "block": _block()}},
    )
    args = flatten_arguments(block)
    assert "id" not in args
    assert "timeouts" not in args


def test_block_shape_and_required_from_min_items():
    block = _block(block_types={
        "logging": {"nesting_mode": "list", "max_items": 1, "block": _block(
            attributes={"log_bucket": {"type": "string", "optional": True}})},
        "needed": {"nesting_mode": "list", "min_items": 1, "block": _block()},
    })
    args = flatten_arguments(block)
    assert args["logging"] == {"type": "block", "description": "", "required": False}
    assert args["needed"]["required"] is True
    # nested leaf uses dotted key
    assert args["logging.log_bucket"]["type"] == "string"


def test_deep_nested_dotted_keys():
    block = _block(block_types={
        "rule": {"nesting_mode": "list", "block": _block(block_types={
            "action": {"nesting_mode": "list", "min_items": 1, "block": _block(
                attributes={"type": {"type": "string", "required": True}})},
        })},
    })
    args = flatten_arguments(block)
    assert args["rule"]["type"] == "block"
    assert args["rule.action"]["type"] == "block"
    assert args["rule.action.type"]["required"] is True
    # leaf name 'type' under a block must not collide with the 'type' field name
    assert args["rule.action.type"]["type"] == "string"


def test_object_typed_attribute_expands_to_block():
    block = _block(attributes={
        "cfg": {"optional": True, "type": ["list", ["object", {
            "host": "string", "port": "number"}, ["port"]]]},
    })
    args = flatten_arguments(block)
    assert args["cfg"]["type"] == "block"
    assert args["cfg.host"]["type"] == "string"
    assert args["cfg.host"]["required"] is True          # not in optional list
    assert args["cfg.port"]["required"] is False         # listed optional
