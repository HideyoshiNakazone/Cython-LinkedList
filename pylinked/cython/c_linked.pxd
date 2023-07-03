# cython: language_level = 3
# distutils: language = c++

from libcpp.string cimport string


cdef extern from "liblinked.h":
    cdef cppclass Node[T]:
        T value

        Node(T value)
        Node(Node* other)

        Node* next()

        void add(T value)
        void add(Node* other)

        Node* pop()
        Node* pop(T value)

        Node* find_by_value(T value)
        void insert_after_value(T value, Node* new_head)

ctypedef Node[int] IntNode
ctypedef Node[double] DoubleNode
ctypedef Node[string] StringNode
