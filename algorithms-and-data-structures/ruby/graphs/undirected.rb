class Vertex
    attr_reader :data

    def initialize(data)
        @data = data
    end
end

class Graph
    attr_reader :vertices, :edges

    def initialize(data)
        @vertices = []
        @edges = []
    end

    # adjacency list
    def to_list()
    end

    # adjacency matrix
    def to_matrix
end