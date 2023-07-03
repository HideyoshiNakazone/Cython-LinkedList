#include <iostream>
#include <memory>

template<class T>
class Node {
    public:
        T value;

        Node(T value);

        Node(Node* other) {
            this->assign_from(other);
        };

        ~Node() {
            delete this->next_node;
        };

        Node* next(); 
        
        void add(T value);
        void add(Node* node);

        Node* pop();
        Node* pop(T value);
        
        Node* find_by_value(T value);
        void insert_after_value(T value, Node* new_head);

    private:
        Node* next_node;

        Node* assign_from(Node* other);
};


template<typename T>
Node<T>* create_linked_list(T size);


template<typename T>
void print_linked_list(Node<T>* head);

// Simplified Type Declarations for Cython
template class Node<int>;
template class Node<double>;
template class Node<std::string>;