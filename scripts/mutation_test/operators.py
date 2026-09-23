from __future__ import annotations

import copy
import re
from dataclasses import dataclass
from typing import Any


SUPPORTED_POLICY_TYPES = {
    "whitelist",
    "blacklist",
    "range",
    "pattern whitelist",
    "pattern blacklist",
    "element blacklist",
    "element pattern whitelist",
    "map key blacklist",
}


@dataclass(frozen=True)
class GeneratedMutation:
    """
    One adversarial configuration mutation generated from
    PDE policy metadata.
    """

    operator: str
    value: Any
    rationale: str


def generate_mutations(
    policy_type: str,
    current_value: Any,
    policy_values: list[Any],
) -> list[GeneratedMutation]:
    """
    Generate policy-aware adversarial values without reading the
    non-compliant Terraform fixture.

    A policy type may produce more than one useful mutation.
    """

    normalized = policy_type.strip().lower()

    if normalized == "whitelist":
        return _generate_whitelist(
            current_value,
            policy_values,
        )

    if normalized == "blacklist":
        return _generate_blacklist(
            current_value,
            policy_values,
        )

    if normalized == "range":
        return _generate_range(
            current_value,
            policy_values,
        )

    if normalized == "pattern whitelist":
        return _generate_pattern_whitelist(
            current_value,
            policy_values,
        )

    if normalized == "pattern blacklist":
        return _generate_pattern_blacklist(
            current_value,
            policy_values,
        )

    if normalized == "element blacklist":
        return _generate_element_blacklist(
            current_value,
            policy_values,
        )

    if normalized == "element pattern whitelist":
        return _generate_element_pattern_whitelist(
            current_value,
            policy_values,
        )

    if normalized == "map key blacklist":
        return _generate_map_key_blacklist(
            current_value,
            policy_values,
        )

    return []


def _generate_whitelist(
    current_value: Any,
    allowed: list[Any],
) -> list[GeneratedMutation]:

    if isinstance(current_value, list):
        # PDE's array whitelist requires every configured allowed
        # value to be present. Remove one allowed member.
        for allowed_value in allowed:
            if allowed_value in current_value:
                mutated = copy.deepcopy(
                    current_value
                )

                mutated.remove(
                    allowed_value
                )

                return [
                    GeneratedMutation(
                        operator=(
                            "whitelist-remove-allowed-value"
                        ),
                        value=mutated,
                        rationale=(
                            "Remove a required whitelisted "
                            "array element."
                        ),
                    )
                ]

        return []

    candidate = _outside_allowed_value(
        current_value,
        allowed,
    )

    if candidate is None:
        return []

    return [
        GeneratedMutation(
            operator="whitelist-outside-allowlist",
            value=candidate,
            rationale=(
                "Replace the compliant value with a value "
                "outside the whitelist."
            ),
        )
    ]


def _outside_allowed_value(
    current_value: Any,
    allowed: list[Any],
):
    if isinstance(current_value, bool):
        candidate = not current_value

        if candidate not in allowed:
            return candidate

        return None

    if isinstance(current_value, int) and not isinstance(
        current_value,
        bool,
    ):
        candidate = current_value + 1

        while candidate in allowed:
            candidate += 1

        return candidate

    if isinstance(current_value, float):
        candidate = current_value + 1.0

        while candidate in allowed:
            candidate += 1.0

        return candidate

    if isinstance(current_value, str):
        candidate = "__PDE_MUTATION_OUTSIDE_ALLOWLIST__"

        while candidate in allowed:
            candidate += "_X"

        return candidate

    if current_value is None:
        candidate = "__PDE_MUTATION_NON_NULL__"

        if candidate not in allowed:
            return candidate

    return None


def _generate_blacklist(
    current_value: Any,
    forbidden: list[Any],
) -> list[GeneratedMutation]:

    if not forbidden:
        return []

    if isinstance(current_value, list):
        # Empty list is a special blacklist value in the PDE helper.
        if [] in forbidden and current_value != []:
            return [
                GeneratedMutation(
                    operator="blacklist-empty-array",
                    value=[],
                    rationale=(
                        "Replace the safe list with the explicitly "
                        "blacklisted empty array."
                    ),
                )
            ]

        for bad_value in forbidden:
            if isinstance(bad_value, list):
                continue

            mutated = copy.deepcopy(
                current_value
            )

            if bad_value not in mutated:
                mutated.append(
                    bad_value
                )

            return [
                GeneratedMutation(
                    operator="blacklist-inject-value",
                    value=mutated,
                    rationale=(
                        "Inject a blacklisted value into "
                        "the array."
                    ),
                )
            ]

        return []

    for bad_value in forbidden:
        if isinstance(bad_value, list):
            continue

        if _compatible_scalar_types(
            current_value,
            bad_value,
        ):
            return [
                GeneratedMutation(
                    operator="blacklist-use-forbidden-value",
                    value=bad_value,
                    rationale=(
                        "Replace the safe scalar with a "
                        "blacklisted value."
                    ),
                )
            ]

    for bad_value in forbidden:
        if not isinstance(
            bad_value,
            (list, dict),
        ):
            return [
                GeneratedMutation(
                    operator="blacklist-use-forbidden-value",
                    value=bad_value,
                    rationale=(
                        "Replace the safe value with a "
                        "blacklisted value."
                    ),
                )
            ]

    return []


def _compatible_scalar_types(
    left: Any,
    right: Any,
) -> bool:

    if isinstance(left, bool):
        return isinstance(right, bool)

    if isinstance(left, (int, float)) and not isinstance(
        left,
        bool,
    ):
        return (
            isinstance(right, (int, float))
            and not isinstance(right, bool)
        )

    if isinstance(left, str):
        return isinstance(right, str)

    return type(left) is type(right)


def _generate_range(
    current_value: Any,
    bounds: list[Any],
) -> list[GeneratedMutation]:

    if len(bounds) != 2:
        return []

    lower = bounds[0]
    upper = bounds[1]

    if not _is_number(lower) or not _is_number(upper):
        return []

    if not _is_number(current_value):
        return []

    step = (
        1
        if all(
            isinstance(value, int)
            and not isinstance(value, bool)
            for value in (
                current_value,
                lower,
                upper,
            )
        )
        else 1.0
    )

    below = lower - step
    above = upper + step

    return [
        GeneratedMutation(
            operator="range-below-minimum",
            value=below,
            rationale=(
                "Move the value below the inclusive "
                "minimum boundary."
            ),
        ),
        GeneratedMutation(
            operator="range-above-maximum",
            value=above,
            rationale=(
                "Move the value above the inclusive "
                "maximum boundary."
            ),
        ),
    ]


def _is_number(value: Any) -> bool:
    return (
        isinstance(value, (int, float))
        and not isinstance(value, bool)
    )


def _generate_pattern_whitelist(
    current_value: Any,
    values: list[Any],
) -> list[GeneratedMutation]:

    if len(values) != 2:
        return []

    target = values[0]
    allowed_groups = values[1]

    if not isinstance(target, str):
        return []

    if not isinstance(allowed_groups, list):
        return []

    star_count = target.count("*")

    if star_count == 0:
        return []

    mutations: list[GeneratedMutation] = []

    base_segments = []

    for index in range(star_count):
        group = (
            allowed_groups[index]
            if index < len(allowed_groups)
            else []
        )

        if isinstance(group, list) and group:
            base_segments.append(
                str(group[0])
            )
        else:
            base_segments.append(
                "pde-valid"
            )

    for index, group in enumerate(
        allowed_groups
    ):
        if index >= star_count:
            break

        if not isinstance(group, list):
            continue

        invalid = "__PDE_NOT_ALLOWED__"

        while invalid in group:
            invalid += "_X"

        segments = list(
            base_segments
        )

        segments[index] = invalid

        value = _render_wildcard_target(
            target,
            segments,
        )

        mutations.append(
            GeneratedMutation(
                operator=(
                    f"pattern-whitelist-invalid-position-{index}"
                ),
                value=value,
                rationale=(
                    "Generate a value with one wildcard segment "
                    "outside its position-specific whitelist."
                ),
            )
        )

    return mutations


def _generate_pattern_blacklist(
    current_value: Any,
    values: list[Any],
) -> list[GeneratedMutation]:

    if len(values) != 2:
        return []

    target = values[0]
    forbidden_groups = values[1]

    if not isinstance(target, str):
        return []

    if not isinstance(
        forbidden_groups,
        list,
    ):
        return []

    star_count = target.count("*")

    if star_count == 0:
        return []

    mutations: list[GeneratedMutation] = []

    safe_segments = [
        "pde-safe"
        for _ in range(star_count)
    ]

    for index, group in enumerate(
        forbidden_groups
    ):
        if index >= star_count:
            break

        if not isinstance(group, list):
            continue

        if not group:
            continue

        bad_segment = group[0]

        if not isinstance(
            bad_segment,
            (str, int, float),
        ):
            continue

        segments = list(
            safe_segments
        )

        segments[index] = str(
            bad_segment
        )

        value = _render_wildcard_target(
            target,
            segments,
        )

        mutations.append(
            GeneratedMutation(
                operator=(
                    f"pattern-blacklist-match-position-{index}"
                ),
                value=value,
                rationale=(
                    "Generate a value whose wildcard segment "
                    "matches a position-specific blacklist."
                ),
            )
        )

    return mutations


def _render_wildcard_target(
    target: str,
    segments: list[str],
) -> str:

    parts = target.split("*")

    result = parts[0]

    for index in range(
        len(parts) - 1
    ):
        segment = (
            segments[index]
            if index < len(segments)
            else "pde-value"
        )

        result += (
            segment
            + parts[index + 1]
        )

    return result


def _generate_element_blacklist(
    current_value: Any,
    patterns: list[Any],
) -> list[GeneratedMutation]:

    if not isinstance(current_value, list):
        return []

    for pattern in patterns:
        if not isinstance(pattern, str):
            continue

        mutated = copy.deepcopy(
            current_value
        )

        violating_element = (
            f"pde-prefix{pattern}pde-suffix"
        )

        mutated.append(
            violating_element
        )

        return [
            GeneratedMutation(
                operator=(
                    "element-blacklist-inject-substring"
                ),
                value=mutated,
                rationale=(
                    "Inject an array element containing "
                    "a blacklisted substring."
                ),
            )
        ]

    return []


def _generate_element_pattern_whitelist(
    current_value: Any,
    patterns: list[Any],
) -> list[GeneratedMutation]:

    string_patterns = [
        pattern
        for pattern in patterns
        if isinstance(pattern, str)
    ]

    if not string_patterns:
        return []

    bad_element = _find_non_matching_element(
        string_patterns
    )

    if bad_element is None:
        return []

    if isinstance(current_value, list):
        mutated = copy.deepcopy(
            current_value
        )

        mutated.append(
            bad_element
        )

    elif isinstance(current_value, str):
        mutated = bad_element

    else:
        return []

    return [
        GeneratedMutation(
            operator=(
                "element-pattern-whitelist-invalid-element"
            ),
            value=mutated,
            rationale=(
                "Inject an element that does not match any "
                "required wildcard resource-path shape."
            ),
        )
    ]


def _find_non_matching_element(
    patterns: list[str],
) -> str | None:

    candidates = [
        "",
        "/",
        "__PDE_INVALID__",
        "__PDE_INVALID__/EXTRA",
        "__PDE_INVALID__/EXTRA/SEGMENT/OVERFLOW",
    ]

    for candidate in candidates:
        if not any(
            _wildcard_shape_matches(
                pattern,
                candidate,
            )
            for pattern in patterns
        ):
            return candidate

    return None


def _wildcard_shape_matches(
    pattern: str,
    value: str,
) -> bool:
    """
    Mirror PDE element-pattern-whitelist semantics:
    '*' matches one or more non-'/' characters.
    """

    parts = pattern.split("*")

    expression = (
        "^"
        + "[^/]+".join(
            re.escape(part)
            for part in parts
        )
        + "$"
    )

    return (
        re.fullmatch(
            expression,
            value,
        )
        is not None
    )


def _generate_map_key_blacklist(
    current_value: Any,
    blacklisted_keys: list[Any],
) -> list[GeneratedMutation]:

    if not isinstance(
        current_value,
        dict,
    ):
        return []

    for prohibited_key in blacklisted_keys:
        if not isinstance(
            prohibited_key,
            str,
        ):
            continue

        if not prohibited_key.strip():
            continue

        mutated = copy.deepcopy(
            current_value
        )

        mutated[prohibited_key] = (
            "__PDE_INLINE_MUTATION_VALUE__"
        )

        return [
            GeneratedMutation(
                operator=(
                    "map-key-blacklist-inject-key"
                ),
                value=mutated,
                rationale=(
                    "Inject a prohibited map key with "
                    "a non-empty inline value."
                ),
            )
        ]

    return []