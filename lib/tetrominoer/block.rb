module Tetrominoer

  #Major class for creating blocks, every block has these features.
  #Each block has its own color to print in console
  #A block's configs are the number of rows and columns necessary to house them,
  #And their filled spots on that alloted housing
  class Block
    @shape = Hash.new()
    attr_reader :shape, :name, :size
    def initialize
      @name = self.class.to_s.split("::")[1]
    end

    def longest_edge_size
      [shape.first[:rows], shape.first[:columns]].max
    end

    def shortest_edge_size
      [shape.first[:rows], shape.first[:columns]].min
    end

  end

  class O < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].cyan
      @shape =
        [{
          rows: 2,
          columns: 2,
          config: [1,1,1,1]
         }]
    end
  end

  class L < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].magenta
      @shape =
        [{
          rows: 3,             #01
          columns: 2,          #01
          config: [0,1,0,1,1,1]#11
        },
         {
          rows: 2,             #100
          columns: 3,          #111
          config: [1,0,0,1,1,1]
        },
         {
          rows: 3,             #11
          columns: 2,          #10
          config: [1,1,1,0,1,0]#10
        },
         {
          rows: 2,             #111
          columns: 3,          #001
          config: [1,1,1,0,0,1]
        }
        ]
    end
  end

  class R < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].yellow
      @shape =
        [{
          rows: 3,              #1
          columns: 2,           #1
          config: [1,0,1,0,1,1] #11
         },
         {
          rows: 2,              #111
          columns: 3,           #1
          config: [1,1,1,1,0,0]
         },
         {
          rows: 3,              #11
          columns: 2,           # 1
          config: [1,1,0,1,0,1] # 1
         },
         {
          rows: 2,              #  1
          columns: 3,           #111
          config: [0,0,1,1,1,1]
        }
        ]
    end
  end

  class I < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].green
      @shape =
        [{
          rows: 1,
          columns: 4,
          config: [1,1,1,1] #1111
         },
         {
          rows: 4,          #1
          columns: 1,       #1
          config: [1,1,1,1] #1
         }                  #1
        ]
    end
  end

  class SmallI < Block
    def initialize
      @size = 3
      @name = "|".green
      @shape =
        [{
          rows: 1,
          columns: 3,
          config: [1,1,1] #111
         },
         {
          rows: 3,          #1
          columns: 1,       #1
          config: [1,1,1]   #1
         }
        ]
    end
  end

  class Box < Block
    def initialize
      @size = 1
      @name = "B".cyan
      @shape =
        [{
          rows: 1,
          columns: 1,
          config: [1] #1
         }
        ]
    end
  end


  class Corner < Block
    def initialize
      @size = 3
      @name = "C".red
      @shape =
        [{
          rows: 2,
          columns: 2,
          config: [1,1,0,1] #11
        },                  # 1
         {
          rows: 2,           # 1
          columns: 2,        #11
          config: [0,1,1,1]
        },
        {
         rows: 2,           #1
         columns: 2,        #11
         config: [1,0,1,1]
       },
        {
         rows: 2,           #11
         columns: 2,        #1
         config: [1,1,1,0]
        }
        ]
    end
  end

  class S < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].red
      @shape =
        [{
          rows: 2,
          columns: 3,           # 11
          config: [0,1,1,1,1,0] #11
         },
         {
          rows: 3,              #1
          columns: 2,           #11
          config: [1,0,1,1,0,1] # 1
         }
        ]
    end
  end

  class Z < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1]
      @shape =
        [{
          rows: 2,
          columns: 3,           #11
          config: [1,1,0,0,1,1] # 11
         },
         {
          rows: 3,              # 1
          columns: 2,           #11
          config: [0,1,1,1,1,0] #1
         }
        ]
    end
  end

  class T < Block
    def initialize
      @size = 4
      @name = self.class.to_s.split("::")[1].blue
      @shape =
        [{
          rows: 3,              #1
          columns: 2,           #11
          config: [1,0,1,1,1,0] #1
         },
         {
          rows: 2,              #111
          columns: 3,           # 1
          config: [1,1,1,0,1,0]
         },
         {
          rows: 3,              # 1
          columns: 2,           #11
          config: [0,1,1,1,0,1] # 1
         },
         {
          rows: 2,              # 1
          columns: 3,           #111
          config: [0,1,0,1,1,1]
        }
        ]

    end
  end
end
