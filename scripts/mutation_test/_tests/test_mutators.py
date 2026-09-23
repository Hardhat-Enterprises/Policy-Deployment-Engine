from scripts.mutation_test.mutators import (
    get_nested_value,
    set_nested_value,
)


def test_get_nested_value_with_nested_list():
    data = {
        "endpoint": [
            {
                "uri": "https://example.com"
            }
        ]
    }

    result = get_nested_value(
        data,
        ["endpoint", 0, "uri"],
    )

    assert result == "https://example.com"


def test_set_nested_value_changes_copy_only():
    original = {
        "settings": {
            "enabled": True
        }
    }

    mutated = set_nested_value(
        original,
        ["settings", "enabled"],
        False,
    )

    assert original["settings"]["enabled"] is True
    assert mutated["settings"]["enabled"] is False


def test_set_nested_value_supports_nested_list_path():
    original = {
        "basic": [
            {
                "enabled": True
            }
        ]
    }

    mutated = set_nested_value(
        original,
        ["basic", 0, "enabled"],
        False,
    )

    assert original["basic"][0]["enabled"] is True
    assert mutated["basic"][0]["enabled"] is False