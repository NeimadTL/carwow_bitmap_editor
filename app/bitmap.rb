class Bitmap


	def initialize(columns, rows)
	  if columns >= 1 && columns <= 250 && rows >= 1 && rows <= 250
	  	@columns = columns
	  	@rows = rows
        @array = Array.new(rows) {Array.new(columns,'O')}
      else
        puts "Try again : columns and rows should be between 1 and 250 😉"
      end
  	end


  	def show_bitmap
  	  @array.each do |row|
        puts "#{row}"
      end
  	end


  	def clear_bitmap
  	  @array.each do |row|
        row.each do |col|
          col.replace('O')
        end
      end
  	end


  	def draw_vertical_line(in_x, from_y1, to_y2, color)
  	  if in_x >= 1 && in_x <= @columns && from_y1 >= 1 && from_y1 <= @rows && to_y2 >= 1 && to_y2 <= @rows
  	    @array.each_with_index do |row, row_index|        
          if(row_index >= from_y1 && row_index <= to_y2)
            row.each_with_index do |col, col_index|
              if(col_index == in_x)
                @array[row_index - 1][col_index -1] = color
              end
            end
          end
        end
      else
      	puts "Try again : column X should be between 1 and #{@columns}; rows Y1 and Y2 should be between 1 and #{@rows} 😉"
	  end
  	end


  	def draw_horizontal_line(in_y, from_x1, to_x2, color)
  	  if in_y >= 1 && in_y <= @rows && from_x1 >= 1 && from_x1 <= @columns && to_x2 >= 1 && to_x2 <= @columns
  	    @array.each_with_index do |row, row_index|        
          if(row_index == in_y)
            row.each_with_index do |col, col_index|
              if(col_index >= from_x1 && col_index <= to_x2)
                @array[row_index -1][col_index -1] = color
              end
            end
          end
        end
      else
        puts "Try again : row Y should be between 1 and #{@rows}; columns X1 and X2 should be between 1 and #{@columns} 😉"
      end
  	end


  	def color_point(in_x, in_y, color)
  	  if x >= 1 && x <= @columns && y >= 1 && y <= @rows
      	@array[in_y -1][in_x -1] = color
      else
      	puts "Try again : X should be between 1 and #{@columns}; Y should be between 1 and #{@rows} 😉"
      end
    end

end