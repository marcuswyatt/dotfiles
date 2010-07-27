#!/usr/bin/env ruby

require 'rubygems'
require 'pp'
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
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

begin
  load "#{ENV['HOME']}/.railsrc" if ENV['RAILS_ENV']
rescue LoadError
end

begin
  require 'ap'

  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end  
rescue LoadError
end

