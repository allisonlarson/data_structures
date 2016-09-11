class Node
  attr_reader :data
  attr_accessor :left, :right

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
    node = Node.new(data)
    return @root_node = node unless @root_node

    current_node = @root_node
    while current_node
      if current_node.data < data
        if current_node.right
          current_node = current_node.right
        else
          current_node.right = node
          break
        end
      else
        if current_node.left
          current_node = current_node.left
        else
          current_node.left = node
          break
        end
      end
    end
  end
end
