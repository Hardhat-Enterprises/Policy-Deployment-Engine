from scripts.mutation_test.operators import (
    SUPPORTED_POLICY_TYPES,
    generate_mutations,
)


def test_all_eight_policy_types_are_registered():
    assert SUPPORTED_POLICY_TYPES == {
        "whitelist",
        "blacklist",
        "range",
        "pattern whitelist",
        "pattern blacklist",
        "element blacklist",
        "element pattern whitelist",
        "map key blacklist",
    }


def test_whitelist_scalar_generates_outside_value():
    mutations = generate_mutations(
        "whitelist",
        "PREVENT",
        ["PREVENT"],
    )

    assert len(mutations) == 1
    assert mutations[0].value != "PREVENT"
    assert mutations[0].value not in ["PREVENT"]


def test_whitelist_boolean_flips_value():
    mutations = generate_mutations(
        "whitelist",
        True,
        [True],
    )

    assert mutations[0].value is False


def test_blacklist_generates_forbidden_scalar():
    mutations = generate_mutations(
        "blacklist",
        "DESKTOP_WINDOWS",
        ["OS_UNSPECIFIED"],
    )

    assert mutations[0].value == "OS_UNSPECIFIED"


def test_range_generates_both_boundary_mutants():
    mutations = generate_mutations(
        "range",
        90,
        [30, 3650],
    )

    assert len(mutations) == 2
    assert mutations[0].value < 30
    assert mutations[1].value > 3650


def test_pattern_whitelist_generates_disallowed_segment():
    mutations = generate_mutations(
        "pattern whitelist",
        "projects/123456789",
        [
            "*/",
            [["projects"]],
        ],
    )

    assert len(mutations) == 1
    assert mutations[0].value != "projects/"


def test_pattern_blacklist_generates_forbidden_segment():
    mutations = generate_mutations(
        "pattern blacklist",
        "https://proxy.example.com",
        [
            "*://*",
            [
                [
                    "ftp",
                    "ssh",
                    "telnet",
                ]
            ],
        ],
    )

    assert len(mutations) == 1
    assert mutations[0].value.startswith(
        "ftp://"
    )


def test_element_blacklist_injects_forbidden_substring():
    mutations = generate_mutations(
        "element blacklist",
        ["storage.googleapis.com"],
        [
            "*",
            "*.googleapis.com",
        ],
    )

    assert len(mutations) == 1

    mutated = mutations[0].value

    assert len(mutated) == 2
    assert "*" in mutated[-1]


def test_element_pattern_whitelist_adds_invalid_element():
    mutations = generate_mutations(
        "element pattern whitelist",
        [
            "projects/p1/locations/us-central1"
        ],
        [
            "projects/*/locations/*"
        ],
    )

    assert len(mutations) == 1

    assert len(
        mutations[0].value
    ) == 2


def test_map_key_blacklist_injects_prohibited_key():
    original = {
        "X-Request-Source": "dialogflow"
    }

    mutations = generate_mutations(
        "map key blacklist",
        original,
        [
            "authorization",
            "x-api-key",
        ],
    )

    assert len(mutations) == 1

    assert (
        mutations[0]
        .value["authorization"]
        == "__PDE_INLINE_MUTATION_VALUE__"
    )

    assert original == {
        "X-Request-Source": "dialogflow"
    }


def test_unknown_policy_type_returns_no_mutations():
    assert (
        generate_mutations(
            "unknown",
            "safe",
            ["bad"],
        )
        == []
    )