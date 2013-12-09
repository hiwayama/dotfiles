# vim: ft=ruby :

# -------------------------- #
# dotfiles/pryrc
#
# Author: Hiromasa IWAYAMA
# -------------------------- #

# Set current directory path
CURRENT = `pwd`.strip + "/"
$:.unshift CURRENT

# editor
Pry.config.editor = 'vim'

# Load a few useful gems.
begin
  require'awesome_print'
  require'awesome_print/ext/active_record'
  require'awesome_print/ext/active_support'
  require'active_support'
rescue LoadError => err
  puts "not installed :(  #{err}"
end
Pry.config.print = proc {|output, value| output.puts value.ai }

# load ruby files which exist in current dir.
def load_current
  Dir.glob("#{CURRENT}*.rb") do |rb_file|
    require rb_file
    puts "required #{File.basename(rb_file)}"
  end
end

# Benchmarking
def time(repetitions = 100, &block)
  require'benchmark'
  Benchmark.bm do |b|
    b.report{repetitions.times(&block)}
  end
end

