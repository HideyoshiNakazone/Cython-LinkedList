from pylinked.c_linked import PyIntNode, PyDoubleNode, PyStringNode
from pylinked.node import Node

import unittest


class TestNode(unittest.TestCase):
    def test_class_instantiation(self):
        self.assertIsInstance(Node(1), PyIntNode)
        self.assertIsInstance(Node(1.), PyDoubleNode)
        self.assertIsInstance(Node(''), PyStringNode)