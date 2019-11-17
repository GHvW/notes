class ListNode
    def initialize()
        
    end
end

class Graph
  attr_reader :vertices, :edges
  def initialize()
    @vertices = Set.new
    @edges = Set.new
  end

  def add_edge(from, to, weight)
    #check vertices for from and to ****
    @edges.add(Edge.new(from, to, weight))
  end

  def add_vertex(data)
    @vertices.add(Vertex.new(data))
  end

  def as_adj_list()
  end

  def as_adj_matrix()
  end
end

def dijkstra(graph, start)
end

def breadth_first_search(graph, start)
end

def depth_first_search(graph, start, to_find)
  if start == to_find
    return start
end