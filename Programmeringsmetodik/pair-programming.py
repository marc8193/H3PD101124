#!/usr/bin/env python3

import unittest

class Node():
    def __init__(self, data):
        self.data = data
        self.next = None
        self.head = self

    def insertAtBegin(self, data):
        new_node = Node(data)
        
        new_node.next = self.head
        self.head = new_node

    def removeAtBegin(self):
        if self.next: self.head = self.next

    def count(self):
        i = 0
        current = self.head
        
        try:
            while True:
                if current.next: 
                    i += 1

                current = self.next
        except AttributeError:
            pass

        return i + 1

    def toString(self):
        current = self.head
        i = str(current.data) + " "
        
        try:
            while True:
                if current.next: 
                    i += str(current.next.data) + " "

                current = self.next
        except AttributeError:
            return i.strip()

        return "";

    def sort(self):
        i = 0
        oldListCount = self.count()

        current = self.head        
        SortedLinkedList = Node(current.data)

        try:
            while True:
                if current.next.data > current.data:
                    SortedLinkedList.insertAtBegin(current.next.data)
                else:
                    SortedLinkedList.next = Node(current.next.data)
                
                current = current.next
                newListCount = SortedLinkedList.count()

                if newListCount == oldListCount:
                    return SortedLinkedList
                      
        except AttributeError:
            return SortedLinkedList

class TestLinkedList(unittest.TestCase):
    def test_insertAtBegin(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(20)
        linked_list.insertAtBegin(30)

        self.assertEqual(linked_list.head.data, 30)
        self.assertEqual(linked_list.head.next.data, 20)
        self.assertEqual(linked_list.head.next.next.data, 10)

    def test_removeAtBegin(self):
        linked_list = Node(10)
        linked_list.insertAtBegin(69)

        linked_list.removeAtBegin()

        self.assertEqual(linked_list.head.data, 69)

    def test_count(self):
        linked_list = Node(10)
        linked_list.insertAtBegin(69)

        counted = linked_list.count()

        self.assertEqual(counted, 2)

    def test_toString(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(69)
        linked_list.insertAtBegin(42)

        tostringed = linked_list.toString()

        self.assertEqual(tostringed, "42 69 10")

    def test_sort(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(69)
        linked_list.insertAtBegin(45)
        # sorted = linked_list.sort()

        tostringed = linked_list.toString()

        self.assertEqual(tostringed,"69 45 10")

if __name__ == '__main__':
    unittest.main()
