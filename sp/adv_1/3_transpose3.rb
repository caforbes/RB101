# I: nested array
# O: new nested array -- columns exchanged to rows
# Q: is the array always going to be square? need to validate types? empty?

# create new result matrix
  # add same num of empty lists to result for length of first matrix element
# iterate through rows in input matrix
  # iterate through items in the row with col index
  # add item to row in result matrix corresponding to item index
# return result matrix

def transpose(matrix)
  result = Array.new(matrix[0].length) { [] }

  matrix.each do |row|
    row.each_with_index do |item, col_idx|
      result[col_idx] << item
    end
  end

  # # 2: assign item to result matrix with swapped row/col indexes
  # matrix.each_with_index do |row, row_idx|
  #   row.each_with_index do |item, col_idx|
  #     result[col_idx][row_idx] = item
  #   end
  # end

  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# now transpose in place

def transpose!(matrix)

end