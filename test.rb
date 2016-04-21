class Flanders
  attr_reader :doodlies, :response

  def initialize
    @doodlies = ['arky','bitty','dahdilly','dandy','dang','di','diddly','ding','do','doddily','dokelees','dokely','dokey','dong','doodly','fella','hiddly','ho','iddly','moodly','neighborino','okelly','okey','oodly','purple drapes','shoodily','twosies']
    @response = ''
  end

  # Build the paragraphs of text
  def getDoodlies(num_doodlies)

    # Until we reach the requested amount of paragraphs...
    num_doodlies.times do

      paragraph = ''

      # Setup paragraph length
      paragraph_sentence_count = rand(1..3)
      paragraph_sentence_count.times do

        sentence = ''

        # Setup sentence word length
        sentence_word_count = rand(15..25)
        sentence_word_count.times do

          sentence << @doodlies[rand(@doodlies.length)]

          # Add punctuation or spaces
          random_num = rand(1..10)

          if random_num == 1
            sentence << '.'
            sentence.capitalize

          elsif random_num == 2
            sentence << ','

          elsif random_num == 3
            sentence << '!'
            sentence.capitalize
          end

          sentence << ' '
        end

        paragraph << sentence
        # @response << response_string
        @response << paragraph
      end

      # End of paragraph
      @response << "\n\n"

    end

    puts @response
  end
end

Neighbour = Flanders.new
puts 'Enter doodlies...'
Neighbour.getDoodlies(gets.chomp.to_i)

