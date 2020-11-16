# frozen_string_literal: true

require 'open-uri'
# Service to download ftp files from the server
class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = params[:word]
    @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  def included?(word)
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
