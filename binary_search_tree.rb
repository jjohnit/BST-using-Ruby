require_relative 'node'

class BinarySearchTree

  attr_reader :root

  def initialize
    @root = nil
  end

  #For inserting a new node to the BST
  def insert(value)
    node = @root
    #When the BST is empty, set the new node as root
    if node == nil
      @root = Node.new(value)
    else
      #Find the node where the new node has to be added
      until node == nil
        previous_node = node
        #Skip if the new value is a duplicate
        if node.value == value
          return
        elsif node.value > value
          node = node.left
        else
          node = node.right
        end

      end
      #Add the new node to the correct side
      if previous_node.value > value
        previous_node.left = Node.new(value)
      else
        previous_node.right = Node.new(value)
      end
    end
  end

  #To delete a particular node containing value from the BST
  def delete(value)
    @root = delete_node(@root, value)
  end

  def delete_node(root, value)
    if root == nil
      return root
    end
    #Find the node which contains node to be deleted
    if value < root.value
      root.left = delete_node(root.left, value)
    elsif value > root.value
      root.right = delete_node(root.right, value)
    #The node to be deleted
    else
      #When the node to be deleted contains only one child, replace the node with the child
      if root.left == nil
        return root.right
      elsif root.right == nil
        return root.left
      #The node to be deleted contains both the children
      else
        #replace the value of node with that of the smallest node in the right child
        min_node = root.right
        while min_node.left != nil
          min_node = min_node.left
        end
        root.value = min_node.value
        #Delete the minNode
        root.right = delete_node(root.right, root.value)
      end
    end
    root
  end

  #To do the union of current bst with another bst y
  def union(y)
    #Recursively add the values of bst y to the current bst until we reach the last node
    unless y == nil
      self.insert(y.value)
      union(y.left)
      union(y.right)
    end
  end

  #To modify the current bst as the intersection of y
  def intersection(y, node = @root)
    if node == nil
      return node
    end
    #If the current bst don't contain the value, remove the same from the current bst
    if y.contains(node.value) == false
      self.delete(node.value)
    end
    intersection(y, node.left)
    intersection(y, node.right)
  end

  #To deep copy the values of y to the current bst
  def deep_copy(y)
    @root = nil
    insert_from_bst(y.root)
  end

  #Recursively add values from a bst to the current bst
  def insert_from_bst(node)
    if node == nil
      return node
    end
    self.insert(node.value)
    insert_from_bst(node.left)
    insert_from_bst(node.right)
  end

  def execute_lambda(lambda, node = @root)
    if node == nil
      return node
    end
    block = eval lambda
    execute_lambda(lambda, node.left)
    print "#{block.call(node.value)} "
    execute_lambda(lambda, node.right)
  end

  #check whether the bst contains the value
  def contains(value)
    node = @root
    until node == nil
      if node.value == value
        return true
      elsif node.value > value
        node = node.left
      else
        node = node.right
      end
    end
    false
  end

  #Recursively display the values of the bst
  def display(node, output)
    unless node == nil
      output = display(node.left, output)
      output += "#{node.value} "
      output = display(node.right, output)
    end
    output
  end

  #To display the BST
  def to_s
    display(@root, "")
  end

  private :delete_node, :insert_from_bst

end
