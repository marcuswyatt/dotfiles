# Usage: jeweler [options] reponame
# e.g. jeweler the-perfect-gem
#         --directory [DIRECTORY]      specify the directory to generate into
#
#         --rspec                      generate rspec code examples
#         --shoulda                    generate shoulda tests
#         --testunit                   generate test/unit tests
#         --bacon                      generate bacon specifications
#         --testspec                   generate test/spec tests
#         --minitest                   generate minitest tests
#         --micronaut                  generate micronaut examples
#         --riot                       generate riot tests
#
#         --cucumber                   generate cucumber stories in addition to the other tests
#
#         --reek                       generate rake task for reek
#         --roodi                      generate rake task for roodi
#
#         --[no-]gemcutter             setup project for gemcutter
#         --rubyforge                  setup project for rubyforge
#         --summary [SUMMARY]          specify the summary of the project
#         --description [DESCRIPTION]  specify a description of the project
#
#         --user-name [USER_NAME]      the user's name, ie that is credited in the LICENSE
#         --user-email [USER_EMAIL]    the user's email, ie that is credited in the Gem specification
#
#         --github-username [GITHUB_USERNAME]
#                                      name of the user on GitHub to set the project up under
#         --github-token [GITHUB_TOKEN]
#                                      GitHub token to use for interacting with the GitHub API
#         --git-remote [GIT_REMOTE]    URI to set the git origin remote to
#         --homepage [HOMEPAGE]        the homepage for your project (defaults to the GitHub repo)
#         --create-repo                create the repository on GitHub
#
#         --yard                       use yard for documentation
#         --rdoc                       use rdoc for documentation
#     -h, --help                       display this help and exit



# export JEWELER_OPTS="--rspec --cucumber --gemcutter --yard --reek --roodi"