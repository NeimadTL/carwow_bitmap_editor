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
      #puts @bitmap.inspect
    end


    def show_image
      @bitmap.each do |item|
        puts "#{item}"
      end
    end


    def clear_image
      @bitmap.each do |row|
        row.each do |item|
          item.replace('O')
        end
      end
    end
end
