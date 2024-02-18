// Solution by Vladislav Pavlov
// Difficulty: Easy
// Topics: Stack, Design, Queue
//
//Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).
//
//Implement the MyStack class:
//
//void push(int x) Pushes element x to the top of the stack.
//int pop() Removes the element on the top of the stack and returns it.
//int top() Returns the element on the top of the stack.
//boolean empty() Returns true if the stack is empty, false otherwise.
//Notes:
//
//You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
//Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
// 
//
//Example 1:
//
//Input
//["MyStack", "push", "push", "top", "pop", "empty"]
//[[], [1], [2], [], [], []]
//Output
//[null, null, null, 2, 2, false]
//
//Explanation
//MyStack myStack = new MyStack();
//myStack.push(1);
//myStack.push(2);
//myStack.top(); // return 2
//myStack.pop(); // return 2
//myStack.empty(); // return False

class QueueNode<T> {
    let data: T
    var next: QueueNode<T>?
    
    init(_ data: T) {
        self.data = data
    }
}

class Queue<T> {
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    
    func push(item: T) {
        let node = QueueNode(item)
        node.next = first
        
        first = node
        
        if last == nil {
            last = first
        }
    }
    
    func pop() -> T? {
        if first == nil {
            return nil
        }
        
        let data = first?.data
        first = first?.next
        
        if first == nil {
            last = nil
        }
        
        return data
    }
    
    func top() -> T? {
        if first == nil {
            return nil
        }
        
        return first?.data
    }
    
    func empty() -> Bool {
        return first == nil
    }
    
}

class MyStack {
    
    private let queue = Queue<Int>()
    
    func push(_ x: Int) {
        queue.push(item: x)
    }
    
    func pop() -> Int {
        return queue.pop() ?? 0
    }
    
    func top() -> Int {
        return queue.top() ?? 0
    }
    
    func empty() -> Bool {
        return queue.empty()
    }
    
}
