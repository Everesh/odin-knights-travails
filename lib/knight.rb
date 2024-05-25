class Knight
  BOARD_SIZE = 8 # Represented as a width of a squre
  MOVE_SET = [[2, -1], [2, 1], [1, 2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [-1, -2]].freeze

  def knight_moves(start, finish)
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
end
