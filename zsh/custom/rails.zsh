rails_version=`rails -v | grep -m 1 'Rails' | sed 's/^.*Rails[ ]*//' | sed 's/["]//g' `

alias tl='tail -f tail -f log/development.log /var/log/apache2/*_log'

if [[ $rails_version == 2.* ]] ; then
  ###############
  # RAILS 2.x.x #
  ###############

  # thin server
  alias ts='thin start'
  alias ss='thin --stats "/thin/stats" start'

  # mongrel server
  alias mr='mongrel_rails start'
  alias ms='mongrel_rails stop'

  # passenger
  alias rp='touch tmp/restart.txt'

  alias sc='ruby script/console --irb="irb --simple-prompt -r irb/completion -rubygems"'
  alias sd='ruby script/dbconsole'
  alias sg='ruby script/generate'
  alias sp='ruby script/plugin'
  alias ss='ruby script/server'
  alias ssr='ruby script/server_restart'
  alias ssd='ruby script/server --debugger'
  alias ssp='ruby script/spec'

elif [[ $rails_version == 3.* ]]; then

  ###########
  # RAILS 3 #
  ###########
  alias r='rails'

  # The most common rails commands are:
  alias rg='r g'                 # Generate new code (short-cut alias: "g")
  alias rc='r c'                 # Start the Rails console (short-cut alias: "c")
  alias rs='r s'                 # Start the Rails server (short-cut alias: "s")
  alias rdb='r db'               # Start a console for the database (short-cut alias: "db")

  # In addition to those, there are:
  #  application                   Generate the Rails application code
  #  destroy                       Undo code generated with "generate"
  alias rbench='r benchmarker'   # See how fast a piece of code runs
  alias rprof='r profiler'       # Get profile information from a piece of code
  alias rp='r plugin'            # Install a plugin
  alias rr='r runner'            # Run a piece of code in the application environment

fi