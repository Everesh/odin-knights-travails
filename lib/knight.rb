class Knight
  BOARD_SIZE = 8 # Represented as a width of a squre
  MOVE_SET = [[2, -1], [2, 1], [1, 2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [-1, -2]].freeze

  def self.knight_moves(start, finish)
    queue = [[start, []]]
    loop do
      position = queue.shift
      current_pos = position[0]
      history = position[1] + [current_pos]
      return history if history[-1] == finish

      MOVE_SET.each do |move|
        new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]
        queue << [new_pos, history] if new_pos.all? { |pos| pos.between?(0, BOARD_SIZE - 1) }
      end
    end
  end

  # Is bound to break with double digits
  #   Can be solved with some logs
  def self.console_knight(start, finish)
    moves = knight_moves(start, finish)

    print '  '
    (BOARD_SIZE - 1).times do |legend_row|
      print "  #{legend_row} "
    end
    puts
    BOARD_SIZE.times do |row|
      print '  +'
      (BOARD_SIZE - 1).times do
        print '---+'
      end
      puts
      print "#{row} "
      (BOARD_SIZE - 1).times do |column|
        index = moves.find_index { |move| move == [row, column] }
        index = ' ' if index.nil?
        print "| #{index} "
      end
      puts '|'
    end
    print '  '
    (BOARD_SIZE - 1).times do
      print '+---'
    end
    puts '+'
    print "=> Thats #{moves.size} #{moves.size == 1 ? 'move' : 'moves'} ->"
    moves.each { |move| print " #{move}" }
    puts
  end
end
