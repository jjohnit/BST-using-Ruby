require_relative 'node'
require_relative 'binary_search_tree'

def display_xyz(x, y, z)
  puts "\nX : #{x}\nY : #{y}\nZ : #{z}"
end

#To assign the values to a BST X,Y, or Z
def set_bst(values)
  #Seperate each number in the string, remove the extra spaces and convert to integer
  x = values.split(',').map { |s| s.strip.to_i }
  new_bst = BinarySearchTree.new
  x.each { |i | new_bst.insert(i) }
  new_bst
end

#Rotate the contents of X, Y, & Z. Y becomes X, Z becomes Y, & X becomes Z
def rotate_sets(x, y, z)
  return z, x, y
end

#Switch the values of X and Y
def switch_x_and_y(x, y)
  return y, x
end

x_bst = y_bst = z_bst = BinarySearchTree.new
display_xyz(x_bst, y_bst, z_bst)

while true
  puts "\nEnter a command (x [values], y [values], z [values], a [value], r, s, u, i, c, l [aString], q)"
  command = gets.chomp

  begin
    case command[0]
    when "q", "Q"
      break
    when "r", "R"
      x_bst, y_bst, z_bst = rotate_sets(x_bst, y_bst, z_bst)
    when "s", "S"
      x_bst, y_bst = switch_x_and_y(x_bst, y_bst)
    when "u", "U"
      x_bst.union(y_bst.root)
    when "i", "I"
      x_bst.intersection(y_bst)
    when "c", "C"
      y_bst.deep_copy(x_bst)
    when "a", "A"
      x_bst.insert(command.split()[1].to_i)
    when "l", "L"
      x_bst.execute_lambda(command.split(" ", 2)[1])
      puts ""
    when "x", "X"
      x_bst = set_bst(command.split(" ", 2)[1])
    when "y", "Y"
      y_bst = set_bst(command.split(" ", 2)[1])
    when "z", "Z"
      z_bst = set_bst(command.split(" ", 2)[1])
    else
      puts "Please provide a valid input"
    end

  #To handle exceptions
  rescue
    puts "Please check the input format"
  end

  #Display the values of X, Y, & Z after every command
  display_xyz(x_bst, y_bst, z_bst)
end