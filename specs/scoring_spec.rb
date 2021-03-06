require_relative 'spec_helper'

describe "scoring" do

  before do
    @score = Scrabble::Scoring.new
  end

  describe "SCORE_CHART" do

    it "must be able to return SCORE_CHART hash" do
      Scrabble::Scoring::SCORE_CHART.must_be_kind_of Hash
    end #it "must be able to initilize @score_chart as a hash"

    it "SCORE_CHART must include A-Z" do
      ("A".."Z").each do |letter|
        Scrabble::Scoring::SCORE_CHART.keys.must_include letter
      end #.each
    end #it "@score_chart must include ("A".."z")" do

  end #describe "initialize" do

  describe "self.score(word)" do

    it "must be a class method" do
      Scrabble::Scoring.must_respond_to :score
    end #it "must be a class method" do

    it "will return an integer score" do
      Scrabble::Scoring.score("HELLO").must_be_kind_of Integer
    end #it "will return an integer score"

    it "will return the right score for cat" do
      Scrabble::Scoring.score("CAT").must_equal 5
    end #it "will return the right score for a word" do

    it "will return the right score for elephant" do
      Scrabble::Scoring.score("turkey").must_equal 13
    end #it "will return the right score for elephant" do

    it "will add 50 to a 7 letter word" do
      Scrabble::Scoring.score("CATTTTT").must_equal 59
    end

  end #describe "self.score(word)" do

  describe "self.highest_score_from_array_array(array_of_words)" do

    it "should return a string" do
      Scrabble::Scoring.highest_score_from_array(["cat", "dog", "pony"]).must_be_kind_of String
    end #it "should return a string" do

    it "should pick the highest scoring word" do
      Scrabble::Scoring.highest_score_from_array(["cat", "pony"]).must_equal "PONY"
    end #it "should pick the highest scoring word" do

    it "if equal, should pick the word with 7 letters" do
      Scrabble::Scoring.highest_score_from_array(["cat", "pony", "animals"]).must_equal "ANIMALS"
    end #it "if equal, should pick the word with 7 letters" do

    it "if equal, it should pick the word with least number of letters" do
      Scrabble::Scoring.highest_score_from_array(["dog", "train"]).must_equal "DOG"
    end #it "if equal, should pick the word with 7 letters" do

    it "if equal in score and length, it should pick the first word in the list" do
      Scrabble::Scoring.highest_score_from_array(["dog", "god"]).must_equal "DOG"
    end #it "if equal in score and length, it should pick the first word in the list" do

  end # Describe

end #describe "scoring" do
