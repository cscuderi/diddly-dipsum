require 'sinatra'
require 'JSON'

set :port, 80
set :environment, :development
set :public_folder, 'public'


# √ 1. Build a 'database' of strings in Flanders' talk
# √ 2. Prompt user for how many paragraphs of Flanders they want
#   3. Build paragraphs by pulling strings from the database at random
#   3.5 Add random dashes between words instead of spaces
#   4. Cap paragraphs at 40 words, 55 words or 70 words (randomly)
#   5. Count up until we have the number of paragraphs requested
#   6. Return the paragraphs

class DiddlyServer
  doodlies = ['okey', 'dokey', 'dokelees', 'dandy', 'diddly', 'di', 'do', 'iddly', 'ho', 'neighborino', 'ding', 'dong', 'bitty', 'arky', 'twosies', 'purple drapes', 'fella', 'doodly', 'oodly', 'doddily', 'shoodily', 'dahdilly', 'okelly', 'dokely']

  # Verify the input and route the call
  def initialize
    # Get the number of requested paragraphs here!
    return 'Hi neighborino!'
  end

  # Build the paragraphs of text
  def getDoodlies(numRequested)
    counter = 0
    response = ''

    until counter == numRequested do
      response += doodlies[rand(doodlies.length)]
      counter += 1
    end

    return response
  end
end

Diddly = DiddlyServer.new


get '/' do
  redirect './index.html'
end

get '/diddlies/:num' do
  return 'Heard you'
  # Diddly.initialize
end
