#!/usr/bin/env ruby

# Tetrominoer, solve small polyomino puzzles
#     Copyright (C) 2015 William H Duncan III

#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

$: << File.join(File.dirname(__FILE__), "..", "lib")
require "tetrominoer"

module Tetrominoer

  o = Tetrominoer::O.new()
  l = Tetrominoer::L.new()
  r = Tetrominoer::R.new()
  i = I.new()
  s = S.new()
  z = Z.new()
  t = Tetrominoer::T.new()
  corner = Tetrominoer::Corner.new()
  small_i = Tetrominoer::SmallI.new()
  box = Tetrominoer::Box.new()

choices = false
#-----------Configuration----------------------------------

  #Edit these if you want to narrow the number of possible pieces for a solution
  #Block array lets you chose which blocks you want avaibiale
  #Choices gives you the maximum number of the corresponding block in its index
  #block_array = [o,l,r,i,s,z,t]
#  choices =     [2,2,3,2,2,10]
  #block_array = [r,l,box]

  block_array = [box, l, r, corner, small_i, t]
  choices = [1, 2, 2, 3, 2, 1]
  #This is the size of the board you are putting your tetrominos on
  rows = 6
  columns = 6

  #Set to false if you don't want to be shown solutions until all have been found
  quickprint = true

#-------------End of Configuration-------------------------

  pg = Tetrominoer::PossibilityGenerator.new(rows, columns)
  pg.generate(block_array)
  possibilities = pg.possibility_space

  solver = Solver.new(possibilities, block_array)

  if choices
    solver = Solver.new(possibilities, block_array, rows, columns, choices, quickprint)
  else
    solver = Solver.new(possibilities, block_array, rows, columns)
  end

  solutions = solver.solve(possibilities)

  if solutions
    printer = Printer.new(rows, columns)
    solutions.each do |solution|
      puts ''
      output = printer.convert_solution(solution, possibilities)
      printer.print(output, block_array)
      puts ''
    end
    puts "Number of solutions: " + solutions.length.to_s
  else
    puts "Unsolvable"
  end

end
