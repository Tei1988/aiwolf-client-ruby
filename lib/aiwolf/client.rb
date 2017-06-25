require 'aiwolf/base'
require 'aiwolf/protocol/attack'
require 'aiwolf/protocol/daily_finish'
require 'aiwolf/protocol/daily_initialize'
require 'aiwolf/protocol/divine'
require 'aiwolf/protocol/finish'
require 'aiwolf/protocol/guard'
require 'aiwolf/protocol/initialize'
require 'aiwolf/protocol/name'
require 'aiwolf/protocol/role'
require 'aiwolf/protocol/talk'
require 'aiwolf/protocol/vote'
require 'aiwolf/protocol/whisper'

module Aiwolf
  class Client < EventMachine::Connection
    include Aiwolf::Base

    include Aiwolf::Protocol::Attack
    include Aiwolf::Protocol::DailyFinish
    include Aiwolf::Protocol::DailyInitialize
    include Aiwolf::Protocol::Divine
    include Aiwolf::Protocol::Finish
    include Aiwolf::Protocol::Guard
    include Aiwolf::Protocol::Initialize
    include Aiwolf::Protocol::Name
    include Aiwolf::Protocol::Role
    include Aiwolf::Protocol::Talk
    include Aiwolf::Protocol::Vote
    include Aiwolf::Protocol::Whisper

  end
end
