
# rbenv
anyenv install plenv 

# plenv
anyenv install plenv 

# ndenv (node)
anyenv install ndenv
exec $SHELL -l
ndenv install v0.10.28
ndenv global v0.10.28
ndenv exec npm install -g bower grunt grunt-contrib grunt-cli mysql
