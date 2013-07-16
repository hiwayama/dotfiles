# init dotfiles

DOTFILES = %w(vimrc vim zshrc zsh tmux.conf gitconfig gemrc sbtconfig)

HOME = File.expand_path(ENV["HOME"])
CURRENT = File.expand_path("./")

# set symlinks
task :link do
  DOTFILES.each do |file|
    begin
      File.symlink("#{CURRENT}/#{file}", "#{HOME}/.#{file}")
    rescue => e
      puts e
    else
      puts "link : #{HOME}/.#{file}"
    end
  end
end

# delete symlinks
task :unlink do
  DOTFILES.each do |file|
    system("rm -f #{HOME}/.#{file}")
    puts "remove : #{HOME}/.#{file}"
  end
end

# submodule update & plugin install
task :init do
  system("git submodule init")
  system("git submodule update")
  system("vim -c \"NeoBundleInstall\"")
end


