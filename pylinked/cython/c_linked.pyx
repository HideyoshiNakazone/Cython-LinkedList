# distutils: language = c++
# cython: language_level = 3

from c_linked cimport IntNode, DoubleNode, StringNode

from libcpp.string cimport string


cdef class PyIntNode:
    cdef IntNode* this_ptr
    cdef IntNode* pivot

    def __cinit__(self, int value):
        self.this_ptr = new IntNode(value)
        self.pivot = self.this_ptr

    def __dealloc__(self):
        del self.this_ptr

    def add(self, int value):
        self.this_ptr.add(value)

    def pop(self):
        self.pivot = self.pivot.next()
        return PyIntNode.from_ptr(self.this_ptr.pop())

    def remove(self, int value):
        return PyIntNode.from_ptr(self.this_ptr.pop(value))

    def has_next(self):
        return self.pivot.next() != NULL

    def __next__(self):
        if self.pivot == NULL:
            self.pivot = self.this_ptr
            raise StopIteration
        else:
            value = self.pivot.value
            self.pivot = self.pivot.next()

            return value

    def __iter__(self):
        cdef IntNode* current = self.this_ptr
        while current != NULL:
            yield current.value
            current = current.next()

    @staticmethod
    cdef PyIntNode from_ptr(IntNode* ptr):
        return PyIntNode(ptr.value)


cdef class PyDoubleNode:
    cdef DoubleNode* this_ptr
    cdef DoubleNode* pivot

    def __cinit__(self, double value):
        self.this_ptr = new DoubleNode(value)
        self.pivot = self.this_ptr

    def __dealloc__(self):
        del self.this_ptr

    def add(self, double value):
        self.this_ptr.add(value)

    def pop(self):
        self.pivot = self.pivot.next()
        return PyDoubleNode.from_ptr(self.this_ptr.pop())

    def remove(self, double value):
        return PyDoubleNode.from_ptr(self.this_ptr.pop(value))

    def has_next(self):
        return self.pivot.next() != NULL

    def __next__(self):
        if self.pivot == NULL:
            self.pivot = self.this_ptr
            raise StopIteration
        else:
            value = self.pivot.value
            self.pivot = self.pivot.next()

            return value

    def __iter__(self):
        cdef DoubleNode* current = self.this_ptr
        while current != NULL:
            yield current.value
            current = current.next()

    @staticmethod
    cdef PyDoubleNode from_ptr(DoubleNode* ptr):
        return PyDoubleNode(ptr.value)


cdef class PyStringNode:
    cdef StringNode* this_ptr
    cdef StringNode* pivot

    def __cinit__(self, str value):
        c_value = <string> value.encode('utf-8')
        self.this_ptr = new StringNode(c_value)
        self.pivot = self.this_ptr

    def __dealloc__(self):
        del self.this_ptr

    def add(self, string value):
        self.this_ptr.add(value)

    def pop(self):
        self.pivot = self.pivot.next()
        return PyStringNode.from_ptr(self.this_ptr.pop())

    def remove(self, string value):
        return PyStringNode.from_ptr(self.this_ptr.pop(value))

    def has_next(self):
        return self.pivot.next() != NULL

    def __next__(self):
        if self.pivot == NULL:
            self.pivot = self.this_ptr
            raise StopIteration
        else:
            value = self.pivot.value
            self.pivot = self.pivot.next()

            return value

    def __iter__(self):
        cdef StringNode* current = self.this_ptr
        while current != NULL:
            yield current.value
            current = current.next()

    @staticmethod
    cdef PyStringNode from_ptr(StringNode* ptr):
        return PyStringNode(ptr.value)