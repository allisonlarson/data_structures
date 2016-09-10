class Node
  attr_reader :data,
    :left,
    :right

  def initialize(data, left=nil, right=nil)
    @data = data
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_reader :root_node

  def initialize
    @root_node = nil
  end

  def push(data)
    @root_node = Node.new(data)
  end
end
