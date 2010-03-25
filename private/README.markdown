# Private Configuration #

Add any private configuration files that you don't want to share with the world here.

For example, I keep my gitconfig which gets installed into the system git directory here. The file might look as follows:

    #!/usr/bin/env ruby
    [user]
      name = Your Name
      email = Your Email
    [github]
      user = Github Username
      token = Github Token

On my system, I created a symlink to /usr/local/git/etc/gitconfig
