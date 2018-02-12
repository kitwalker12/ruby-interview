# Desing a class which iterates through a Conway's Game of Life world
#https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

class Conway
  attr_accessor :blocks

  def initialize(rows, cols)
    @blocks = []
    for i in (0...rows) do
      @blocks.push([])
      for j in (0...cols) do
        @blocks[i].push(Block.new(i,j,self))
      end
    end
  end

  def set_initial_state(i,j,state)
    block = block_at_pos(i,j)
    if block
      block.alive! if state
      block.dead!  if !state
    end
  end

  def block_at_pos(i,j)
    if i >= @blocks.length || j >= @blocks[0].length || i < 0 || j < 0
      return nil
    else
      return @blocks[i][j]
    end
  end

  def period!
    to_kill = []
    to_live = []
    for i in (0...@blocks.length) do
      for j in (0...@blocks[0].length) do
        block = block_at_pos(i,j)
        if block
          neighbors = block.live_neighbors
          if block.alive?
            if neighbors < 2
              to_kill << block
            elsif neighbors >=2 && neighbors <=3
              to_live << block
            elsif neighbors > 3
              to_kill << block
            end
          else
            if neighbors == 3
              to_live << block
            end
          end
        end
      end
    end

    to_kill.each { |x| x.dead! }
    to_live.each { |x| x.alive! }

    return
  end

  def print
    for i in (0...@blocks.length) do
      for j in (0...@blocks[0].length) do
        block = block_at_pos(i,j)
        if block.alive?
          $stdout.print("O")
        else
          $stdout.print("X")
        end
      end
      puts ""
    end
  end
end

class Block
  attr_accessor :i, :j, :alive, :matrix

  def initialize(i,j,matrix)
    @i, @j, @matrix = i,j,matrix
  end

  def alive?
    return @alive
  end

  def dead?
    return !@alive
  end

  def alive!
    @alive = true
  end

  def dead!
    @alive = false
  end

  def neighbors
    n = []
    n << matrix.block_at_pos(i,j-1) #left
    n << matrix.block_at_pos(i,j+1) #right
    n << matrix.block_at_pos(i-1,j) #top
    n << matrix.block_at_pos(i+1,j) #bottom
    n << matrix.block_at_pos(i-1,j-1) #top-left
    n << matrix.block_at_pos(i-1,j+1) #top-right
    n << matrix.block_at_pos(i+1,j-1) #bottom-left
    n << matrix.block_at_pos(i+1,j+1) #bottom-right

    return n.compact
  end

  def live_neighbors
    neighbors.select{|x| x.alive? }.count
  end
end


new_game = Conway.new(5,5)
new_game.set_initial_state(2,1,true)
new_game.set_initial_state(2,2,true)
new_game.set_initial_state(2,3,true)
new_game.print
puts "---"
new_game.period!
new_game.print
puts "---"
new_game.period!
new_game.print
puts "---"
new_game.period!
new_game.print
