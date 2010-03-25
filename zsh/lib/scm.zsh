function scm() {
  if [ -e ".svn" ]; then
    echo "svn:"
  elif [ -e ".git" ]; then
    echo "git:"
  elif [ -e "CVS" ]; then
    echo "cvs:"
  elif [ -e "_darcs" ]; then
    echo "darcs:"
  elif [ -n "`grep pwd ~/.svk/config 2>/dev/null`" ]; then
    echo "svk:"
  else
    echo ""
  fi
}
