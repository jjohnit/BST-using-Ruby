class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = @right = nil
  end
end
