from pylinked.c_linked import PyIntNode

import unittest


class TestPyIntNode(unittest.TestCase):
    def test_class_instantiation(self):
        node = PyIntNode(1)
        self.assertIsInstance(node, PyIntNode)

    def test_class_raises_exception_on_value_not_int(self):
        with self.assertRaises(TypeError):
            node = PyIntNode('Error')

    def test_next_raises_stop_iteration(self):
        node = PyIntNode(1)

        self.assertEqual(next(node), 1)

        with self.assertRaises(StopIteration):
           next(node)

    def test_has_next(self):
        node = PyIntNode(1)
        self.assertFalse(node.has_next())

        node.add(2)

        self.assertTrue(node.has_next())

    def test_next(self):
        node = PyIntNode(1)
        node.add(2)
        node.add(3)

        self.assertEqual(next(node), 3)
        self.assertEqual(next(node), 2)
        self.assertEqual(next(node), 1)

    def test_add(self):
        node = PyIntNode(1)
        node.add(2)

        self.assertEqual(next(node), 2)

    def test_pop(self):
        node = PyIntNode(1)
        node.add(2)

        self.assertEqual(next(node), 2)

        node.pop()
        with self.assertRaises(StopIteration):
            self.assertIsNone(next(node))

    def test_remove(self):
        node = PyIntNode(1)
        node.add(2)
        node.add(3)

        node.remove(2)
        
        condition = False
        while node.has_next():
            if next(node) == 2:
                condition = True

        self.assertFalse(condition)

    def test_iter(self):
        node = PyIntNode(1)
        node.add(2)
        node.add(3)


        for i, n in enumerate(reversed(list(node))):
            self.assertEqual(n, i + 1)


if __name__ == '__main__':
    unittest.main()
