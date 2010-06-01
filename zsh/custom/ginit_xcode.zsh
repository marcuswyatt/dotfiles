if [[ -x `which git` ]]; then
  
	function ginit_xcode () {
	  git init
	  echo "\n\n# XCode\nbuild\n*.mode1v3\n*.mode2v3\n*.nib\n*.swp\n\
*.pbxuser\n*.perspective\n*.perspectivev3\n\n# OSX\n.DS_Store\n\n\
# TextMate\n*.tm_build_errors\n\n\n" >> .gitignore
	  git add .gitignore
	  git commit -m "Ignore Xcode stuff."
	  git add .
	  git commit -m "Initial Xcode project."
	}
  
fi