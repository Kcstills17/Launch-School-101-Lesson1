require 'pry'
class DNA
  attr_reader :sequence

  def initialize(sequence)
  @sequence = sequence
  end

  def hamming_distance(new_sequence)
    # Convert sequences to arrays of characters
    distance = 0
    arr = sequence.chars
    arr2 = new_sequence.chars

    # Find the minimum length of the two arrays
    min_length = [arr.length, arr2.length].min

    # Zip the arrays up to the minimum length
    zipped_array = arr[0, min_length].zip(arr2[0, min_length])
    binding.pry

     matched_arr = zipped_array.map {|arr| arr.map {|_|  arr[0] == arr[-1] ? true : false}}
     matched_arr.each {|bool| distance += 1 if  bool.include?(false)}

     distance
  end
end


a = DNA.new('ACT')
a.hamming_distance('TATT')
