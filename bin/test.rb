$: << File.join(File.dirname(__FILE__), "..", "lib")
require "tetrominoer"

o = Tetrominoer::O.new()
l = Tetrominoer::L.new()
r = Tetrominoer::R.new()
t = Tetrominoer::T.new()
corner = Tetrominoer::Corner.new()
small_i = Tetrominoer::SmallI.new()
box = Tetrominoer::Box.new()

choices = false

block_array = [box]#, l, r, corner, small_i, t]
#choices = [1, 2, 2, 3, 2, 1]
#This is the size of the board you are putting your tetrominos on
rows = 6
columns = 6

#Set to false if you don't want to be shown solutions until all have been found
quickprint = true

#-------------End of Configuration-------------------------

pg = Tetrominoer::PossibilityGenerator.new(rows, columns)
pg.generate(block_array)
possibilities = pg.possibility_space
