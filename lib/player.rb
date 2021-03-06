#
module Scrabble
  class Player
    attr_reader :name, :player_words, :total_score, :tiles_in_hand
    def initialize(name)
      @name = name
      @player_words = []
      @total_score = 0
      @tiles_in_hand = []
    end

    def plays
      return @player_words
    end #plays

    def play(play_word)
      play_word = play_word.upcase
      arg_test = play_word.split("")
      arg_test.each do |l|
        if !(@tiles_in_hand.include? (l))
          raise ArgumentError.new("Word is not included in your tiles")
        end
      end

      @player_words << play_word
      result = Scrabble::Scoring.score(play_word)
      @total_score += result
      word_array = play_word.split(//)
      # Will remove tiles from the @tiles_in_hand instance
      word_array.each do |letter|
        @tiles_in_hand.delete_at(@tiles_in_hand.index(letter) || @tiles_in_hand.length)
      end

      if won?
        return false
      else
        return result # Score of the play_word
      end
      # CHECK IF WORD IS IN TILES.HAND -> RAISE ARGUMENT ERROR IF NOT IN TILES --> GET_WORD_FOR
        # ELSE
      # CHECK WITH SCRABBLE::DICTIONARY.NEW.COMPARE INPUT WORD TO DICTIONARY WORDS
        # -> RETURN ARGUMENT ERROR IF WORD IS NOT IN DICTIONARY --> GET_WORD_FOR
    end #play

    def highest_scoring_word
      # This returns the highest scoring word from the array
      Scrabble::Scoring.highest_score_from_array(@player_words)
    end #def highest_score_word(word_array)

    def highest_word_score
      # Returns the highest scoring total as an integer
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end # DEF

    def draw_tiles(tile_bag)
      num_to_draw = 7 - @tiles_in_hand.length
      tiles_to_add = tile_bag.draw_tiles(num_to_draw)
      tiles_to_add.each do |tile|
        # Returns an array of tiles
        @tiles_in_hand << tile
      end
    end #def draw_tiles(tile_bag)

  end # Player
end # Scrabble
