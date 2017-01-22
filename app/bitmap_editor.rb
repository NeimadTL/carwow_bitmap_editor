require_relative 'bitmap'
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
        when /^L\s\d\s\d\s[A-Z]/
          color_pixel(input[2].to_i, input[4].to_i, input[6])
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
      @bitmap = Bitmap.new(columns, rows)
    end


    def show_image
      @bitmap.show_bitmap
    end


    def clear_image
      @bitmap.clear_bitmap
    end


    def draw_vertical_segment(in_column, from_row, to_row, color)
      @bitmap.draw_vertical_line(in_column, from_row, to_row, color)
    end


    def draw_horizontal_segment(in_row, from_column, to_column, color)
      bitmap.draw_horizontal_line(in_row, from_column, to_column, color)
    end


    def color_pixel(in_row, in_column, color)
      @bitmap.color_point(in_row, in_column, color)
    end
end