class Image
  attr_accessor :array

  def initialize(array)
    self.array = array
  end

  def output_image
    array.each do |row|
      puts row.join
    end
  end

  def blur
    temp_array = Array.new(array.length) { Array.new(array[0].length) }

    array.each_index do |row|
    subarray = array[row]
      subarray.each_index do |cell|
        if subarray[cell] == 0 && temp_array[row][cell] != 1
          temp_array[row][cell] = 0
        end

        if subarray[cell] == 1 
          temp_array[row][cell] = 1
        # previous cell, previous row
          temp_array[row][cell - 1] = 1 if cell > 0
          temp_array[row - 1][cell] = 1 if row > 0
        # next cell, next row
          temp_array[row][cell + 1] = 1 if (cell + 1) < array[row].length
          temp_array[row + 1][cell] = 1 if (row + 1) < array.length
        end
      end
    end

    self.array = temp_array
  end
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
  ])

image.output_image
image.blur
puts ""
image.output_image
puts ""

image = Image.new([
  [0, 1, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 1],
  [0, 0, 0, 1, 0, 0],
  [1, 0, 0, 0, 0, 0]
  ])

image.output_image
image.blur
puts ""
image.output_image
