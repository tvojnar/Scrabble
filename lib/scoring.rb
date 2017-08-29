# require_relative '../wave-1-game'

module Scrabble
  class Scoring

    SCORE_CHART = {"A" => 1, "E" => 1, "I" => 1,"O" => 1, "U" => 1, "L" => 1,  "N" => 1,"R" => 1,"S" => 1,"T" => 1, "D" => 2, "G" => 2,"B" => 3,"C" => 3,  "M" => 3, "P" => 3,   "F" => 4,"H" => 4,"V" => 4,"W" => 4,"Y" => 4,  "K" => 5,"J" => 8,"X" => 8,"Q" => 10, "Z" => 10,
    }

    def self.score(word)
      word = word.upcase
      word_array = word.split(//)
      if word_array.length == 7
        word_score = 50
      else
        word_score = 0
      end
      word_array.each do |letter|
        word_score += SCORE_CHART[letter]
      end
      return word_score
    end #def self.score(word)

    def self.highest_score_from(array_of_words)
      highest_score = 0
      array_of_words.each do |word|
        if Scrabble::Scoring.score(word) > highest_score
          highest_score = Scrabble::Scoring.score(word)
        end
      end
    end

  end #Scoring
end #Scrabble