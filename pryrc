# vim: ft=ruby :

# -------------------------- #
# dotfiles/pryrc
#
# Author: Hiromasa IWAYAMA
# -------------------------- #

# Set current directory path
CURRENT = `pwd`.strip + "/"

# Load 'awesome_print'
begin
  require'awesome_print'
  require'active_support'
rescue LoadingError => e
  puts e
end

