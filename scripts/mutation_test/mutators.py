from __future__ import annotations

import copy
from typing import Any


def get_nested_value(data: Any, path: list[Any]) -> Any:
    """
    Read a value from a nested dictionary/list structure.

    Path entries may be dictionary keys or list indexes.
    """
    current = data

    for part in path:
        current = current[part]

    return current


def set_nested_value(
    data: Any,
    path: list[Any],
    value: Any,
) -> Any:
    """
    Return a deep copied structure with one nested value replaced.

    The original object is never modified.
    """
    mutated = copy.deepcopy(data)
    current = mutated

    for part in path[:-1]:
        current = current[part]

    current[path[-1]] = value

    return mutated