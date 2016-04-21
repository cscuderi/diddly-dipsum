require 'sinatra'
require 'JSON'

set :port, 80
set :environment, :development
set :public_folder, 'public'

# [√] Build a 'database' of strings in Flanders' talk
# [√] Prompt user for how many paragraphs of Flanders they want
# [√] Receive the variable in Ruby
# [ ] Build paragraphs by pulling strings from the database at random
# [ ] Add random dashes between words instead of spaces
# [ ] Cap paragraphs at 40 words, 55 words or 70 words (randomly)
# [ ] Count up until we have the number of paragraphs requested
# [ ] Return the paragraphs (JSON)

class DiddlyServer
  attr_reader :doodlies

  def initialize(num_doodlies)
    return 'Hi neighborino!'
    @doodlies = ['okey', 'dokey', 'dokelees', 'dandy', 'diddly', 'di', 'do', 'iddly', 'ho', 'neighborino', 'ding', 'dong', 'bitty', 'arky', 'twosies', 'purple drapes', 'fella', 'doodly', 'oodly', 'doddily', 'shoodily', 'dahdilly', 'okelly', 'dokely']
    # Get the number of requested paragraphs here!
  end

  # Build the paragraphs of text
  # def getDoodlies(numRequested)
  #   counter = 0
  #   response = ''

  #   until counter == numRequested do
  #     response += doodlies[rand(doodlies.length)] + ' '
  #     counter += 1
  #   end

  #   return response
  # end

end


get '/' do
  redirect './index.html'
end

get '/diddlies/:num' do
  number_of_diddlies = params[:num].to_i

  unless (number_of_diddlies.is_a? Numeric) && (number_of_diddlies > 0)
    return "Bad input. Number is negative or not a number."
  end

  MyDiddly = DiddlyServer.new(number_of_diddlies)
end
