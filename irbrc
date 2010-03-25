#!/usr/bin/env ruby

require 'rubygems'
require 'pp'
# require 'hirb'
require 'yaml'
require 'irb/completion'
 
unless ENV['RAILS_ENV'] 
  # Prompt behavior
  ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
else
  # Prompt behavior
  ARGV.concat [ "simple" ]
end

# History
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin
  # require 'boson'
  # Boson.start
  
  # Hirb::View.enable

  # require File.join("#{ENV['HOME']}", '.irb', 'object')
  # require File.join("#{ENV['HOME']}", '.irb', 'interactive_editor')
  # require File.join("#{ENV['HOME']}", '.irb', 'wirble')
  # require File.join("#{ENV['HOME']}", '.irb', 'whatis')
  
  load "#{ENV['HOME']}/.railsrc" if ENV['RAILS_ENV']
rescue LoadError
end

#   Wirble.init
#   Wirble.colorize
#