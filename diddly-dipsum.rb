require 'sinatra'
require 'json'

set :environment, :production
set :public_folder, './public'

# [√] Build a 'database' of strings in Flanders' talk
# [√] Prompt user for how many paragraphs of Flanders they want
# [√] Receive the variable in Ruby
# [√] Build paragraphs by pulling strings from the database at random
# [√] Add random dashes between words instead of spaces
# [√] Cap paragraphs at 40 words, 55 words or 70 words (randomly)
# [√] Count up until we have the number of paragraphs requested
# [√] Return the paragraphs

class Flanders
  attr_reader :doodlies, :response

  def initialize
    @doodlies = ['arky','bitty','dahdilly','dandy','dang','di','diddly','dilly','ding','do','doddily','dokelees','dokely','dokey','dong','doodle','doodly','fella','hiddly','ho','iddly','kiddly','lefty','lordy','moodly','neighborino','o','okaley','okey','oodly','purple drapes','shoodily','tizzy','twosies', 'woodely']
  end

  # Build the paragraphs of text
  def getDoodlies(num_doodlies)
    response = ''
    paragraphs = ''
    sentence = ''

    # Until we reach the requested amount of paragraphs...
    num_doodlies.times do

      # Setup paragraphs
      paragraphs = '<p>'

      # How many sentences per paragraph?
      rand(1..3).times do

        # Setup sentences
        sentence = ''

        # How many words per sentence?
        words_per_sentence = rand(15..25)

        until words_per_sentence == 0 do
          word = ''
          word << @doodlies[rand(@doodlies.length)]

          # Add semi-random punctuation or spaces
          # Make sure we're not on the last word
          if words_per_sentence > 1

            random_num = rand(1..10)
            if random_num == 2 && words_per_sentence > 5
              word << ', '
            elsif random_num % 2 == 0
              word << '-'
            else
              word << ' '
            end
          end

          sentence << word
          words_per_sentence -= 1
        end

        # Add ! or . to end of sentence
        if rand(1..10) == 1
          sentence << '! '
        else
          sentence << '. '
        end

        sentence.capitalize!
        paragraphs << sentence
      end

      # End of paragraph
      paragraphs << "</p>"
      response << paragraphs
    end

    return response
  end
end

get '/' do
  redirect './index.html'
end

get '/diddlies/:num' do
  number_of_diddlies = params[:num].to_i

  unless (number_of_diddlies.is_a? Numeric) && (number_of_diddlies > 0)
    return "Oopsie-doopsie, fella. Either that isn't a number or it's a tilly smaller than the number 1."
  end

  Neighbour ||= Flanders.new
  Neighbour.getDoodlies(number_of_diddlies)
end
