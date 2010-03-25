# Project network tools for Github
# REQUIRE: github gem (gem install github)

# Adds all projects in your network as remotes and fetches
# any objects from them that you don't have yet, and then
# create local branch and tracks each remote
function gh_network_fetch_track () {
  $(github network fetch)
  gh_network_remotes_track
}

# Create local branch and tracks each remote
function gh_network_remotes_track () {
  for branch (`git branch -a`); do
    if [[ $branch == remotes/* ]] ; then
      if [[ $branch != remotes/origin/* ]] ; then
        tracking_branch=$(echo $branch | sed 's/^.*remotes\/[ ]*//')
        local_branch_name=`echo $tracking_branch | sed 's/[\/]/_/g'`
        $(git branch --track $local_branch_name $tracking_branch)
      fi
    fi
  done
}