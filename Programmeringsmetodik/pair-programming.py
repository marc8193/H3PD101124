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
    
        while current.next:
            current = current.next
            i += 1

        return i + 1
    
    def toString(self):
        current = self.head
        i = str(current.data) + " "
    
        while current.next:
            current = current.next
            i += str(current.data) + " "

        return i.strip()


    def sort(self):
        i = 0
        oldListCount = self.count()

        current = self.head        
        SortedLinkedList = Node(current.data)

        while current.next:
            if current.next.data > current.data:
                SortedLinkedList.insertAtBegin(current.next.data)
            else:
                SortedLinkedList.next = Node(current.next.data)
            
            current = current.next
            newListCount = SortedLinkedList.count()

            if newListCount == oldListCount:
                return SortedLinkedList
                      
        return SortedLinkedList

    def reverse(self):
        current = self.head
        newList = Node(current.data)
    
        while current.next:
            current = current.next
            newList.insertAtBegin(current.data)

        return newList

    def exist(self, this):
        current = self.head
        while current.next:
            current = current.next
            if(current.data == this):
                return True

        return False

    def delete(self, this):
        current = self.head
        newList = Node(current.data)
    
        while current.next:
            if current.data != this: newList.next = Node(current.data)

            current = current.next

        return newList


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
        sorted = linked_list.sort()

        tostringed = sorted.toString()

        self.assertEqual(tostringed,"69 45 10")

    def test_reverse(self):
        linked_list = Node(10)

        linked_list.insertAtBegin(20)
        linked_list.insertAtBegin(30)

        reversed_list = linked_list.reverse()

        self.assertEqual(reversed_list.head.data, 10)
        self.assertEqual(reversed_list.head.next.data, 20)
        self.assertEqual(reversed_list.head.next.next.data, 30)

    def test_exist(self):
        linked_list = Node(10)
        linked_list.insertAtBegin(20)
        linked_list.insertAtBegin(30)
        
        exist = linked_list.exist(20)
        
        self.assertEqual(exist, True)

    def test_delete(self):
        linked_list = Node(10)
        linked_list.insertAtBegin(20)
        linked_list.insertAtBegin(30)
        
        deleted = linked_list.delete(20)
        
        self.assertEqual(deleted.exist(20), False) 

if __name__ == '__main__':
    unittest.main()
