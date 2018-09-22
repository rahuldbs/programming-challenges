// Node definition
var Node = function(data) {
    this.data = data;
    this.next = null;
}

// https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list/problem
function print(head) {
    while(head != null) {
        console.log(head.data);
        head = head.next;
    }
}

// https://www.hackerrank.com/challenges/insert-a-node-at-the-tail-of-a-linked-list/problem
function insertAtTail(head, data) {
    var current = head
    if (head == null){
        head = new Node(data)
        return head;
    } else {
            while(current.next != null) {
            current = current.next;
        }
        var node = new Node(data);  
        current.next = node;
    }
    return head;
}

// https://www.hackerrank.com/challenges/insert-a-node-at-the-head-of-a-linked-list/problem
function insertAtHead(head, data) {
    if (head == null) {
        head = new Node(data);
    } else {
        var newNode = new Node(data)
        newNode.next = head
        head = newNode
    }
    return head;
}

// https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem
function insertNth(head, data, position) {
    let index = 1
    let current = head
    while (position > 0 && index != position) {
        current = current.next;
        index++;
    }
    if ( head == null) {
        head = new Node(data);
    } else if (position == 0) {
        let node = new Node(data);
        node.next = current;
        head = node;
    } else {
        let node = new Node(data);
        node.next = current.next;
        current.next = node;
    }
    return head;
}

// https://www.hackerrank.com/challenges/delete-a-node-from-a-linked-list/problem
function deleteNode(head, position) {
    if (head.next == null && position == 0) {
        return null;
    } else {
        let index = 1
        let currentNode = head
        if (position == 0) {
            return head.next;
        }
        while (currentNode.next != null && index != position) {
            currentNode = currentNode.next;
            index++;
        }
        // Delete the node
        let temp = currentNode.next;
        if (temp.next == null) {
            currentNode.next = null;
        } else {
            currentNode.next = temp.next   ;
        }
        return head;
    }
}

// https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list-in-reverse/problem
function reversePrint(head) {
    var list = []
        while(head) {
            list.push(head.data)
            head = head.next 
        }

    var len = list.length
    while(len-- > 0) {
        console.log(list[len])
    }
}

// https://www.hackerrank.com/challenges/reverse-a-linked-list/problem
function reverseLinkedList(head) {
    if(head != null) {
        let myNode = head
        let lastNode = new Node(head.data);
        let currentNode = lastNode;
        while(myNode.next != null) {
            myNode = myNode.next;
            let temp = new Node(myNode.data);
            temp.next = currentNode;
            currentNode = temp;
        }
        return currentNode;
    } else {
        return null
    }
}

// https://www.hackerrank.com/challenges/compare-two-linked-lists/problem
function compareLinkedLists( headA, headB) {
    if (headA == null && headB == null) {
        return 1;
    } else {
        
        while (headA != null || headB != null) {
            if(headA && !headB) {
                return 0;
            } else if(!headA && headB) {
                return 0;   
            } else if (headA.data != headB.data) {
                return 0;
            } else {
                headA = headA.next;
                headB = headB.next;
            }
        }
        return 1;
    }
}

// https://www.hackerrank.com/challenges/merge-two-sorted-linked-lists/problem
function mergeLinkedLists( headA, headB) {
    let myNode
    let otherNode
    let head = null
    if (headA == null && headB == null) {
        return null;
    } else if (headA == null && headB != null) {
        return headB;
    } else if (headA != null && headB == null) {
        return headA;
    } else {
        if(headA.data < headB.data) {
            myNode = headA;
            otherNode = headB
        } else {
            myNode = headB;
            otherNode = headA
        }
        let lastNode = null
        head = myNode
        while(myNode != null && otherNode != null) {
            if(otherNode.data < myNode.data) {
                if(lastNode == null) {
                    let tmp = new Node(otherNode.data);
                    tmp.next = myNode;
                    head = tmp;
                    lastNode = tmp;
                }else {
                    let tmp = new Node(otherNode.data);
                    tmp.next = myNode;
                    lastNode.next = tmp;
                    lastNode = tmp;
                }
                otherNode = otherNode.next;
            } else if (myNode.next != null) {
                lastNode = myNode;
                myNode = myNode.next;
            } else {
                myNode.next = otherNode;
                return head;
            }

        }
        return head;
    }

}

// https://www.hackerrank.com/challenges/get-the-value-of-the-node-at-a-specific-position-from-the-tail/problem
function getNodeValue( head, position) {
    var list = [];
    while (head != null) {
        list.push(head.data)
        head = head.next;
    }
    return list[list.length - position - 1];
}

