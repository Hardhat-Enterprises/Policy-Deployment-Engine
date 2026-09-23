from scripts.mutation_test.evaluator import (
    extract_non_compliant_resources,
)


def test_extract_non_compliant_resources():
    details = [
        {
            "situation": "Test",
            "non_compliant_resources": [
                "bad_resource_1",
                "bad_resource_2",
            ],
        }
    ]

    result = extract_non_compliant_resources(
        details
    )

    assert result == {
        "bad_resource_1",
        "bad_resource_2",
    }


def test_extract_non_compliant_resources_empty():
    assert extract_non_compliant_resources([]) == set()
    assert extract_non_compliant_resources(None) == set()


def test_resource_names_are_matched_exactly():
    details = [
        {
            "non_compliant_resources": [
                "non_compliant_example_1"
            ]
        }
    ]

    result = extract_non_compliant_resources(
        details
    )

    assert "non_compliant_example_1" in result

    # Protects against the substring bug discovered
    # during development.
    assert "compliant_example_1" not in result