module Cliche

  class Note

    NOTES = %w{C C# D D# E F F# G G# A A# B}

    def initialize(note)
      @note  = note
      @notes = NOTES.rotate(NOTES.index(@note))
    end
    
    def next
      Note.new(@notes[@notes.index(@note) + 1])
    end
    
    def to_s
      @note
    end
  end

  class Scale
    
    INTERVALS = %w{w w h w w w} # final half-step not required
    
    def initialize(root)
      @root = root
    end
  
    def notes
      [current_note = @root] + INTERVALS.map { |interval|
        case interval
          when 'w'
            current_note = current_note.next.next
          when 'h'
            current_note = current_note.next
        end
        current_note
      }
    end
  end  
end