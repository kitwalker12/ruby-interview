# Depth First Search Implementation in Ruby with arrays

def depth_first_search(adj_matrix,source_index,end_index)
  node_stack = [source_index]

  loop do
    curr_node = node_stack.pop

    return false if curr_node.nil?
    return true if curr_node == end_index

    children = (0...adj_matrix.length).to_a.select do |i|
      adj_matrix[curr_node][i] == 1
    end

    node_stack = node_stack + children
  end
end
