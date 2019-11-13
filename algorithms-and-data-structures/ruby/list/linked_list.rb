class Node
    attr_reader :data
    attr_accessor :next

    def initialize(data, prev, next)
        @data = data
        @next = next
        @prev = prev
    end
end

# not tested
class LinkedList

    def initialize()
        @head = nil
        @last = nil
        @count = 0
    end

    def addFirst(data)
        head = @head
        @head = Node.new(data, nil, head)
        @count += 1
    end

    def removeFirst()
        @count -= 1
    end

    def addLast(data)
        last = @last
        @last.next = Node.new(data, last, nil)
        @count += 1
    end

    def removeLast(data)
        @count -= 1
    end

    def delete(data)
        @count -= 1
    end
end