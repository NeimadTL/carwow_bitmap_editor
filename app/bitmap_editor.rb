require_relative 'bitmap'


class BitmapEditor


  def initialize
    @bitmap
  end
    

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      input_array = input.split(" ")
      case input
        when '?'
          show_help
        when 'X'
          exit_console
        when /^I\s\d{1,3}\s\d{1,3}/
          create_image(input_array[1].to_i,input_array[2].to_i)
        when 'S'
          show_image
        when 'C'
          clear_image
        when /^V\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_vertical_segment(input_array[1].to_i, input_array[2].to_i, input_array[3].to_i, input_array[4])
        when /^H\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[A-Z]/
          draw_horizontal_segment(input_array[1].to_i, input_array[2].to_i, input_array[3].to_i, input_array[4])
        when /^L\s\d{1,3}\s\d{1,3}\s[A-Z]/
          color_pixel(input_array[1].to_i, input_array[2].to_i, input_array[3])
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
      if has_image_been_created?
        @bitmap.show_bitmap
      else
        puts "Try again : make sure to create an image first 😉"
      end
    end


    def clear_image
      if has_image_been_created?
        @bitmap.clear_bitmap
      else
        puts "Try again : make sure to create an image first 😉"
      end
    end


    def draw_vertical_segment(in_column, from_row, to_row, color)
      if has_image_been_created?
        @bitmap.draw_vertical_line(in_column, from_row, to_row, color)
      else
        puts "Try again : make sure to create an image first 😉"
      end
    end


    def draw_horizontal_segment(in_row, from_column, to_column, color)
      if has_image_been_created?
        @bitmap.draw_horizontal_line(in_row, from_column, to_column, color)
      else
        puts "Try again : make sure to create an image first 😉"
      end
    end


    def color_pixel(in_column, in_row, color)
      if has_image_been_created?
        @bitmap.color_point(in_column, in_row, color)
      else
        puts "Try again : make sure to create an image first 😉"
      end
    end


    def has_image_been_created?
      @bitmap ? true : false
    end
end