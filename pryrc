# vim: ft=ruby :

# -------------------------- #
# dotfiles/pryrc
#
# Author: Hiromasa IWAYAMA
# -------------------------- #

# Set current directory path
CURRENT = `pwd`.strip + "/"

# Load a few useful gems.
begin
  require'awesome_print'
  require'active_support'
rescue LoadingError => e
  puts e
end

command_set = Pry::CommandSet.new do
  # load ruby files located at current dir.
  block_command "load_current" do |name|
    Dir.glob("#{CURRENT}*.rb") do |rb_file|
      require rb_file
      puts "required #{File.basename(rb_file)}"
    end
  end
end

Pry::Commands.import command_set
