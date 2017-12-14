def game_of_life(name, size, generations, initial_life=nil)
  board = new_board(size)
  seed(board, size, initial_life)
  print_board( board, name, 0)
  reason = generations.times do |gen|
    new = evolve( board, size)
    print_board(new, name, gen+1)
    break :all_dead if (barren? new, size)
    break :static   if (board == new)
    board = new
  end
  if (reason == :all_dead) then
    puts "All Dead"
  elsif (reason == :static)   then
    puts "No Movement"
  else
    puts "Specified Lifetime Ended"
  end
  puts
end

def new_board(n)
  Array.new(n) {Array.new(n, 0)}
end

def seed(board, n, points=nil)
  if (points.nil?)
    # randomly seed board
    indices = []
    n.times {|x|
      n.times{|y|
        indices << [x,y]
      }
    }
    indices.shuffle[0,10].each {|x,y|
      board[y][x] = 1
    }
  else
    points.each {|x, y|
      board[y][x] = 1
    }
  end
end

def evolve(board, n)
  new = new_board(n)
  n.times {|i|
    n.times {|j|
      new[i][j] = fate(board, i, j, n)
    }
  }
  new
end

def fate(board, i, j, n)
  i1 = [0, i-1].max; i2 = [i+1, n-1].min
  j1 = [0, j-1].max; j2 = [j+1, n-1].min
  sum = 0
  for ii in (i1..i2)
    for jj in (j1..j2)
      sum += board[ii][jj] if not (ii == i and jj == j)
    end
  end
  (sum == 3 or (sum == 2 and board[i][j] == 1)) ? 1 : 0
end

def barren?(board, n)
  n.times {|i|
    n.times {|j|
      return false if board[i][j] == 1
    }
  }
  true
end

def print_board(m, name, generation)
  puts "#{name}: generation #{generation}"
  m.each {|row|
    row.each {|val|
      print "#{val == 1 ? '1' : '0'} "
    }
    puts
  }
end


puts "Please Enter the Serial for Pattern You Want to See : - "
puts " Enter 1 for : Blinker."
puts " Enter 2 for : Glider."
puts " Enter 3 for : Block."
puts " Enter 4 for : Beehive."
puts " Enter 5 for : Loaf."
puts " Enter 6 for : Boat."
puts " Enter 7 for : Toad."
puts " Enter 8 for : Beacon."
puts " Enter 9 for : The R-Pentomino."
puts " Enter 10 for : Diehard."
puts " Enter 11 for : Acorn."
puts " Enter 12 for : Pulsar."
puts " Enter 13 for : Pentadecathlon."
puts " Enter 14 for : Random."
puts " Enter 15 for : Custom Input."

puts "Enter You Input Here : "
choice= gets.to_i
case choice
  when 1
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Blinker", 3, n, [[1,0],[1,1],[1,2]])
  when 2
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Glider", 4, n, [[1,0],[2,1],[0,2],[1,2],[2,2]])
  when 3
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Block", 4, n, [[1,1],[1,2],[2,1],[2,2]])
  when 4
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Beehive", 6, n, [[1,2],[1,3],[2,1],[2,4],[3,2],[3,3]])
  when 5
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Loaf", 6, n, [[1,2],[1,3],[2,1],[2,4],[3,2],[3,3]])
  when 6
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Boat", 5, n, [[1,2],[2,1],[2,3],[3,2]])
  when 7
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Toad", 6, n, [[1,3],[2,1],[2,4],[3,1],[3,4],[4,2]])
  when 8
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Beacon", 6, n, [[1,1],[1,2],[2,1],[3,4],[4,3],[4,4]])
  when 9
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("The R-Pentomino", 5, n, [[1,2],[1,3],[2,1],[2,2],[3,2]])
  when 10
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Diehard", 10, n, [[1,7],[2,1],[2,2],[3,2],[3,6],[3,7],[3,8]])
  when 11
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Acorn", 9, n, [[1,2],[2,4],[3,1],[3,2],[3,5],[3,6],[3,7]])
  when 12
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Pulsar", 15, n, [[1,3],[1,4],[1,5],[1,9],[1,10],[1,11],[3,1],[3,6],[3,8],[3,13],[4,1],[4,6],[4,8],[4,13],[5,1],[5,6],[5,8],[5,13],[6,3],[6,4],[6,5],[6,9],[6,10],[6,11],[8,3],[8,4],[8,5],[8,9],[8,10],[8,11],[9,1],[9,6],[9,8],[9,13],[10,1],[10,6],[10,8],[10,13],[11,1],[11,6],[11,8],[11,13],[13,3],[13,4],[13,5],[13,9],[13,10],[13,11]])
  when 13
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Pentadecathlon", 11, n, [[1,3],[1,8],[2,1],[2,2],[2,4],[2,5],[2,6],[2,7],[2,9],[2,10],[3,3],[3,8]])
  when 14
    puts "Enter size of grid (e.g 5) : "
    size= gets.to_i
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    game_of_life("Random", size, n)
  when 15
    puts "Enter size of grid (e.g 5) : "
    size= gets.to_i
    puts "Enter the number of Generations you want to ovserve : "
    n= gets.to_i
    puts "Enter the custom values for each location as 0 or 1 (0 for dead and 1 for alive, any value above 0 will be considered as 1) : "
    seed_locations=[]
    for i in (0...size)
      for j in (0...size)
        puts "Enter Value for location #{i},#{j} in Grid : "
        l=gets.to_i
        if(l>0)
          seed_locations<<[i,j]
        end
      end
    end
    game_of_life("Custom Board", size, n, seed_locations)
    seed_locations.clear
end
