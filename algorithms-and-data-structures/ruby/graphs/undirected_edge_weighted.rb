class Graph
  attr_reader :vertices, :edges
  def initialize()
    @vertices = Set.new
    @edges = Set.new
  end

  def add_edge(from, to)
    #check vertices for from and to ****
    @edges.add(Edge.new(from, to))
  end

  def add_vertex(data)
    @vertices.add(Vertex.new(data))
  end
end