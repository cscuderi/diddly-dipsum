# Test file so I don't have to keep restarting Sinatra.

class Flanders
  attr_reader :doodlies, :response

  def initialize
    @doodlies = ['arky','bitty','dahdilly','dandy','dang','di','diddly','ding','do','doddily','dokelees','dokely','dokey','dong','doodly','fella','hiddly','ho','iddly','lefty','lordy','moodly','neighborino','o','okelly','okey','oodly','purple drapes','shoodily','twosies']
  end

  # Build the paragraphs of text
  def getDoodlies(num_doodlies)
    response = 'Why, hiddly-ho, neighborino! '
    paragraphs = ''
    sentence = ''

    # Until we reach the requested amount of paragraphs...
    num_doodlies.times do

      # Setup paragraphs
      # Reset, then loop 1-3 sentences per paragraph
      paragraphs = ''
      rand(1..3).times do

        # Setup sentences
        # Reset sentence, then loop 15-25 words per sentence
        sentence = ''

        capitalize_next_word = false

        words_per_sentence = rand(15..25)

        until words_per_sentence == 0 do
          word = ''
          word << @doodlies[rand(@doodlies.length)]

          # TODO Figure out why , and - can appear at end of sentences
          if words_per_sentence > 1

            # Add punctuation or spaces
            random_num = rand(1..10)

            if random_num == 2 && words_per_sentence > 5
              word << ', '
            elsif random_num % 2 == 0
              word << '-'
            else
              word << ' '
            end

          end

          # word << "#{x}"
          sentence << word
          words_per_sentence -= 1
        end

        if rand(1..10) == 1
          sentence << '! '
        else
          sentence << '. '
        end

        sentence.capitalize!

        paragraphs << sentence
      end

      # End of paragraph
      paragraphs << "\n\n"
      response << paragraphs
    end

    puts response
  end
end

Neighbour = Flanders.new
puts 'Enter doodlies...'
Neighbour.getDoodlies(gets.chomp.to_i)

