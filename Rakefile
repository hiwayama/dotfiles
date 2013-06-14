# init dotfiles

DOTFILES = %w(vimrc vim zshrc tmux.conf gitconfig gemrc sbtconfig)

HOME = File.expand_path(ENV["HOME"])
CURRENT = File.expand_path("./")

# set symlinks
task :link do
  DOTFILES.each do |file|
    File.symlink("#{CURRENT}/#{file}", "#{HOME}/.#{file}")
    puts "link : #{HOME}/.#{file}"
  end
end

# delete symlinks
task :unlink do
  DOTFILES.each do |file|
    system("rm -f #{HOME}/.#{file}")
    puts "remove : #{HOME}/.#{file}"
  end
end

task :gitinit do
  system("git submodule init")
  system("git submodule update")
end


