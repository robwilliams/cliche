module Cliche

  class Note

    CHROMATIC_UP   = %w{C C# D D# E F F# G G# A A# B}
    CHROMATIC_DOWN = %w{C Db D Eb E F Gb G Ab A Bb B}
    
    def initialize(note, direction = nil)
      @note  = note
      
      # if this has been set previously when traversiong the scale
      # keep going in that direction
      unless @direction = direction
        @direction   = CHROMATIC_UP.include?(@note) ? :up : :down
      end
      
      if @direction == :up
        @note_index = CHROMATIC_UP.index(@note)
      else
        @note_index = CHROMATIC_DOWN.index(@note)
      end

      @up_notes    = CHROMATIC_UP.rotate(@note_index)
      @down_notes  = CHROMATIC_DOWN.rotate(@note_index)
    end
    
    def next
      case @direction
        when :up
          note = @up_notes[1]
        when :down
          note = @down_notes[1]
      end

      Note.new(note, @direction)
    end
    
    def to_s
      @note
    end
  end

  class Scale
    
    INTERVALS = %w{w w h w w w} # final half-step not required because loops back to octave
    
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
      }
    end
  end  
end