class Bitmap


	def initialize(columns, rows)
	  if(columns >= 1 && columns <= 250 && rows >= 1 && rows <= 250)
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
  	  #if(from_y1 >= @rows && from_y1 <= @rows && to_y2 >= @rows && to_y2 <= @rows && in_x >= @columns && in_x <= @columns)
  	    @array.each_with_index do |row, row_index|        
          if(row_index >= from_y1 && row_index <= to_y2)
            row.each_with_index do |col, col_index|
              if(col_index == in_x)
                @array[row_index][col_index] = color
              end
            end
          end
        end
   #    else
   #    	puts "Try again : column X should be between 1 and #{@columns}; rows Y1 and Y2 should be between 1 and #{@rows} 😉"
	  # end
  	end


  	def draw_horizontal_line(in_y, from_x1, to_x2, color)
  	  #if(from_x1 >= @columns && from_x1 <= @columns && to_x2 >= @columns && to_x2 <= @columns && in_y >= @rows && in_y <= @rows)
  	    @array.each_with_index do |row, row_index|        
          if(row_index == in_y)
            row.each_with_index do |col, col_index|
              if(col_index >= from_x1 && col_index <= to_x2)
                @array[row_index][col_index] = color
              end
            end
          end
        end
      # else
      # 	puts "Try again : row Y should be between 1 and #{@rows}; columns X1 and X2 should be between 1 and #{@columns} 😉"
      # end
  	end


  	def color_point(x, y, color)
      @array[x][y] = color
    end

end