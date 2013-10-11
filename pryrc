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
rescue LoadingError => e
  puts e
end

