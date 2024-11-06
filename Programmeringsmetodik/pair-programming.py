#!/usr/bin/env python3

import unittest

class Node():
    def __init__(self, data):
        self.data = data
        self.next = None
        self.head = self

    def insertAtBegin(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            return
        else:
            new_node.next = self.head
            self.head = new_node

    def removeAtBegin(self):
        if self.head == self:
            if self.next:
                self.next.head = self.next

    def count(self):
        i = 0
        current = self

        while True:
            i += 1

            current = self.next

        return i

class TestLinkedList(unittest.TestCase):
    def test_insertAtBegin(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(69)

        self.assertEqual(linked_list.head.data, 69)
        self.assertEqual(linked_list.head.next.data, 10)

    def test_removeAtBegin(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(69)

        self.assertEqual(linked_list.head.data, 69)
        self.assertEqual(linked_list.head.next.data, 10)

        linked_list.removeAtBegin()

        self.assertEqual(linked_list.head.data, 69)

    def test_count(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(69)

        counted = linked_list.count()

        self.assertEqual(counted, 2)

if __name__ == '__main__':
    unittest.main()
