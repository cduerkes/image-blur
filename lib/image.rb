class Image
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def blur
    temp_array = Array.new(data.length) { Array.new(data[0].length) }

    data.each_index do |row|
    subarray = data[row]
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
          temp_array[row][cell + 1] = 1 if (cell + 1) < data[row].length
          temp_array[row + 1][cell] = 1 if (row + 1) < data.length
        end
      end
    end

    self.data = temp_array
  end
end