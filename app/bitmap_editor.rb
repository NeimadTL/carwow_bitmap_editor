class BitmapEditor


  attr_accessor :bitmap


  def initialize
    @bitmap
  end
    

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      case input
        when '?'
          show_help
        when 'X'
          exit_console
        when /^I\s\d\s\d/
          create_image(input[2].to_i,input[4].to_i)
        when 'S'
          show_image
        when 'C'
          clear_image
        when /^V\s\d\s\d\s\d\s[A-Z]/
          draw_vertical_segment(input[2].to_i, input[4].to_i, input[6].to_i, input[8])
        when /^H\s\d\s\d\s\d\s[A-Z]/
          draw_horizontal_segment(input[2].to_i, input[4].to_i, input[6].to_i, input[8])
        else
          puts 'unrecognised command :('
      end
    end
  end


  private

    def exit_console
      puts 'goodbye!'
      @running = false
    end


    def show_help
      puts "? - Help
      I M N - Create a new M x N image with all pixels coloured white (O).
      C - Clears the table, setting all pixels to white (O).
      L X Y C - Colours the pixel (X,Y) with colour C.
      V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
      H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
      S - Show the contents of the current image
      X - Terminate the session"
    end


    def create_image(columns, rows)
      @bitmap = Array.new(rows) {Array.new(columns,'O')}
    end


    def show_image
      @bitmap.each do |row|
        puts "#{row}"
      end
    end


    def clear_image
      @bitmap.each do |row|
        row.each do |col|
          col.replace('O')
        end
      end
    end


    def draw_vertical_segment(in_column, from_row, to_row, color)
      @bitmap.each_with_index do |row, row_index|        
        if(row_index >= from_row && row_index <= to_row)
          row.each_with_index do |col, col_index|
            if(col_index == in_column)
              @bitmap[row_index][col_index] = color
            end
          end
        end
      end
    end


    def draw_horizontal_segment(in_row, from_column, to_column, color)
      puts "draw_horizontal_segment"
      @bitmap.each_with_index do |row, row_index|        
        if(row_index == in_row)
          row.each_with_index do |col, col_index|
            if(col_index >= from_column && col_index <= to_column)
              @bitmap[row_index][col_index] = color
            end
          end
        end
      end
    end
end