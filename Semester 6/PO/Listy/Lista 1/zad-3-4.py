class LinkedList:
    """Class representing a singly linked list."""

    class Node:
        def __init__(self, value):
            self.value = value
            self.next = None

    def __init__(self, values=None):
        """Initializes the linked list with optional values."""
        self.head = None
        if values:
            for value in reversed(values):
                self.prepend(value)

    def prepend(self, value):
        """Adds a value to the start of the list."""
        node = self.Node(value)
        node.next = self.head
        self.head = node

    def map_procedural(self, func):
        """Creates a new list with function applied to each element (procedural)."""
        result = LinkedList()
        current = self.head
        while current:
            result.prepend(func(current.value))  # Using prepend to maintain order
            current = current.next
        # Convert to list, reverse, and create new LinkedList
        values = list([node.value for node in result])
        return LinkedList(values[::-1])

    def map_functional(self, func):
        """Returns a new linked list with function applied (functional)."""
        return LinkedList([func(node.value) for node in self])

    def filter_procedural(self, predicate):
        """Creates a new list with elements that match predicate (procedural)."""
        result = LinkedList()
        current = self.head
        while current:
            if predicate(current.value):
                result.prepend(current.value)  # Using prepend to maintain order
            current = current.next
        # Convert to list, reverse, and create new LinkedList
        values = list([node.value for node in result])
        return LinkedList(values[::-1])

    def filter_functional(self, predicate):
        """Returns a new linked list with only elements matching predicate (functional)."""
        return LinkedList([node.value for node in self if predicate(node.value)])

    def __iter__(self):
        """Iterator to traverse the linked list."""
        current = self.head
        while current:
            yield current
            current = current.next

    def __repr__(self):
        """String representation of the linked list."""
        return ' -> '.join(str(node.value) for node in self) or "Empty List"

if __name__ == "__main__":
    linked_list = LinkedList([1, 2, 3, 4, 5])
    print("Original List:", linked_list)

    squared_list = linked_list.map_functional(lambda x: x ** 2)
    print("Squared List (functional):", squared_list)

    added_list = linked_list.map_procedural(lambda x: x + 2)
    print("Added 2 List (procedural):", added_list)

    filtered_even = linked_list.filter_functional(lambda x: x % 2 == 0)
    print("Even numbers (functional):", filtered_even)

    filtered_odd = linked_list.filter_procedural(lambda x: x % 2 != 0)
    print("Odd numbers (procedural):", filtered_odd)
