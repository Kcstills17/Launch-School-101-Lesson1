
class Triangle
  attr_reader :side1, :side2, :side3
  attr_accessor :kind

def initialize(side1, side2, side3)
  @side1 = side1
  @side2 = side2
  @side3 = side3
  @kind = determine_triangle
  illegal_sides
  side_inequality
end

def side_inequality
  a = self.side1
  b = self.side2
  c = self.side3
  (a + b) > c && (a + c) > b && (b + c) > a ? true : (raise ArgumentError)
end

def illegal_sides
  sides = [self.side1, self.side2, self.side3]
  raise ArgumentError if sides.all? {|side| side == 0 }
  raise ArgumentError if sides.any? {|side| side < 0 }
end

def determine_triangle
 arr = [self.side1, self.side2, self.side3]
  case
  when arr.all? {|num| num == arr[0]}
    'equilateral'
  when arr.uniq.size == arr.size
    'scalene'
  else
    'isosceles'
  end
end


end



