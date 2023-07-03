from __future__ import annotations

from pylinked.c_linked import PyIntNode, PyDoubleNode, PyStringNode

from typing import Protocol


class NodeType(Protocol):
    value: int | float | str

    def __next__(self):
        pass

    def __iter__(self):
        pass


def Node(value: int | float | str) -> NodeType:
    if isinstance(value, int):
        return PyIntNode(value)

    if isinstance(value, float):
        return PyDoubleNode(value)

    if isinstance(value, str):
        return PyStringNode(value)

    raise TypeError(f"Unsupported type: {type(value)}")
