# frozen_string_literal: true

require 'thor'

require 'aiwolf/base/logger'

module Aiwolf
  class CLI < Thor
    include Aiwolf::Base::Logger

    EXECUTE_INFO_FORMAT = 'Connecting to %s:%d with %s'

    desc 'execute AiClassName', 'play Aiwolf with AiClassName'
    option :host, type: :string, default: '127.0.0.1', aliases: '-h'
    option :port, type: :numeric, default: 10000, aliases: '-p'
    def execute(ai_class)
      logger.info(
        format(
          EXECUTE_INFO_FORMAT,
          options[:host],
          options[:port],
          ai_class,
        ),
      )
      EventMachine.run do
        EventMachine
          .connect(options[:host], options[:port], load_ai_class(ai_class))
      end
    end

    private

    def load_ai_class(ai_class)
      $LOAD_PATH << './'
      path = ai_class.split(/(?=[A-Z])/)
                     .map(&:downcase)
                     .join('_')
                     .gsub('::_', '/')
      require path

      Object.const_get(ai_class)
    end
  end
end
