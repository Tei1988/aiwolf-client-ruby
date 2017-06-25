require 'aiwolf'
require 'aiwolf/base'
require 'aiwolf/commands/attack'
require 'aiwolf/commands/daily_finish'
require 'aiwolf/commands/daily_initialize'
require 'aiwolf/commands/divine'
require 'aiwolf/commands/finish'
require 'aiwolf/commands/guard'
require 'aiwolf/commands/initialize'
require 'aiwolf/commands/name'
require 'aiwolf/commands/role'
require 'aiwolf/commands/talk'
require 'aiwolf/commands/vote'
require 'aiwolf/commands/whisper'

module Aiwolf
  class Client < EventMachine::Connection
    include Aiwolf::Base

    include Aiwolf::Commands::Attack
    include Aiwolf::Commands::DailyFinish
    include Aiwolf::Commands::DailyInitialize
    include Aiwolf::Commands::Divine
    include Aiwolf::Commands::Finish
    include Aiwolf::Commands::Guard
    include Aiwolf::Commands::Initialize
    include Aiwolf::Commands::Name
    include Aiwolf::Commands::Role
    include Aiwolf::Commands::Talk
    include Aiwolf::Commands::Vote
    include Aiwolf::Commands::Whisper

  end
end
