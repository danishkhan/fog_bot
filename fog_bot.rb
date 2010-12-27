require 'cinch'
require 'cinch-memo'

Cinch::Plugins::Memo::Base.configure do |c|
  c.store   = :redis          # data store
  c.host    = 'localhost'     # your host
  c.port    = '6379'          # your port
end

# class Welcome
#   include Cinch::Plugin
# 
#   listen_to :join
#   
#   # def listen(m)
#   #   unless m.user.nick == bot.nick
#   # end
# 
#   def listen(m)
#     m.reply "Welcome to the fog irc channel! I'm the fog-bot. If you need any help just type !help and I will assist you."
#   end
# end

class Help
  include Cinch::Plugin

  match "msg"

  def execute(m)
    m.reply "!memo [nick] [message]: will save a memo for the user and fog-bot will let them know when they join the channel again or the user can type !memo? to view any messages left for them if they were idle"
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server           = "irc.freenode.net"
    c.nick             = "fog-bot"
    c.channels         = ["#ruby-fog"]
    c.plugins.plugins  = [Cinch::Plugins::Memo::Base, Help]
  end

end

bot.start