#include <stdio.h>
#include <stdlib.h>

// Definition of a singly linked list node
typedef struct Node {
    int value;
    struct Node *next;
} Node;

// List creation function
Node* create_list() {
    return NULL;
}

// Add value to list function
Node* add_value(Node* head, int value) {
    Node* new_node = (Node*)malloc(sizeof(Node));
    if(!new_node) return head;  // Handle allocation failure

    new_node->value = value;
    new_node->next = NULL;

    if(!head) {
        return new_node;  // First node
    }

    // Find the last node
    Node* current = head;
    while(current->next) {
        current = current->next;
    }
    current->next = new_node;
    return head;
}

// Procedural version of map function
Node* map_procedural(Node *head, int (*func)(int)) {
    Node *new_head = NULL;
    Node *current = head;

    while(current) {
        // Create new node with transformed value
        Node *new_node = (Node*)malloc(sizeof(Node));
        if(!new_node) return new_head;  // Handle allocation failure

        new_node->value = func(current->value);
        new_node->next = NULL;

        if(!new_head) {
            new_head = new_node;  // First node
        }

        else {
            // Find the last node
            Node *tmp = new_head;
            while(tmp->next) {
                tmp = tmp->next;
            }
            tmp->next = new_node;
        }
        current = current->next;
    }
    return new_head;
}

// Functional version of map function
Node* map(Node *head, int (*func)(int)) {
    if(!head) return NULL;
    Node *new_head = (Node*)malloc(sizeof(Node));
    new_head->value = func(head->value);
    new_head->next = map(head->next, func);
    return new_head;
}

// Example functions to apply
int square(int x) {
    return x * x;
}

int add_two(int x) {
    return x + 2;
}

// Procedural version of filter function
Node* filter_procedural(Node *head, int (*predicate)(int)) {
    Node *new_head = NULL;
    Node *current = head;

    while(current) {
        if(predicate(current->value)) {
            Node *new_node = (Node*)malloc(sizeof(Node));
            if(!new_node) return new_head;  // Handle allocation failure

            new_node->value = current->value;
            new_node->next = NULL;

            if(!new_head) {
                new_head = new_node;  // First node
            }

            else {
                // Find the last node
                Node *tmp = new_head;
                while(tmp->next) {
                    tmp = tmp->next;
                }
                tmp->next = new_node;
            }
        }
        current = current->next;
    }
    return new_head;
}

// Functional version of filter function
Node* filter(Node *head, int (*predicate)(int)) {
    if(!head) return NULL;
    if(predicate(head->value)) {
        Node *new_node = (Node*)malloc(sizeof(Node));
        new_node->value = head->value;
        new_node->next = filter(head->next, predicate);
        return new_node;
    }
    return filter(head->next, predicate);
}

// Example predicate functions
int is_even(int x) {
    return x % 2 == 0;
}

int is_odd(int x) {
    return x % 2 != 0;
}

// Function to print linked list
void print_list(Node *head) {
    while(head) {
        printf("%d ", head->value);
        head = head->next;
    }
    printf("\n");
}

// Function to free linked list memory
void free_list(Node *head) {
    while(head) {
        Node *tmp = head;
        head = head->next;
        free(tmp);
    }
}

int main() {
    Node* list = create_list();
    list = add_value(list, 1);
    list = add_value(list, 2);
    list = add_value(list, 3);
    list = add_value(list, 4);
    list = add_value(list, 5);

    printf("Original list: ");
    print_list(list);

    Node* squared_list = map(list, square);
    printf("Squared list (functional): ");
    print_list(squared_list);

    Node* added_list = map_procedural(list, add_two);
    printf("Added 2 list (procedural): ");
    print_list(added_list);

    Node* filtered_list = filter(list, is_even);
    printf("Even numbers list (functional): ");
    print_list(filtered_list);

    Node* filtered_list_procedural = filter_procedural(list, is_odd);
    printf("Odd numbers list (procedural): ");
    print_list(filtered_list_procedural);

    // Free all remaining lists
    free_list(list);
    free_list(squared_list);
    free_list(added_list);
    free_list(filtered_list);
    free_list(filtered_list_procedural);
    return 0;
}