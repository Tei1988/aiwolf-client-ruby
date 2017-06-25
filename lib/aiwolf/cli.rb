require 'thor'

require 'aiwolf/base/logger'

module Aiwolf
  class CLI < Thor
    include Aiwolf::Base::Logger

    desc 'execute AiClassName', 'play Aiwolf with AiClassName'
    option :host, type: :string, default: '127.0.0.1', aliases: '-h'
    option :port, type: :numeric, default: 10000, aliases: '-p'
    def execute(ai_class)
      logger.info("Connecting to #{options[:host]}:#{options[:port].to_s} with #{ai_class}")
      EventMachine::run do
        EventMachine::connect(options[:host], options[:port], load_ai_class(ai_class))
      end
    end

    private

    def load_ai_class(ai_class)
      $: << './'
      path = ai_class.split(/(?=[A-Z])/).map(&:downcase).join('_').gsub('::_', '/')
      require path

      Object.const_get(ai_class)
    end
  end
end
