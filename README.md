# Gobal vim setting
## Ubuntu & Mac
1. Install .vimrc and .vim
	* `git clone https://github.com/liyi1279/dotfiles ~/dotfiles`
	* `ln -s ~/dotfiles/vimrc ~/.vimrc`
	* `ln -s ~/dotfiles/vim ~/.vim`

2. Re-install Vundle
	* `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
	* `:VundleInstall`

# Vim + R
## Ubuntu
1. Install vim-r-plugin
	* vim version should be > 7.4
	* R version > 3.0 
	* vimcom version 1.2-6
		* `audo apt-get install libx11-dev`
		* _R:>>_`download.file("http://www.lepem.ufc.br.jaa.vimr/vimcom_1.2-6.tar.gz",destfile="vimcom_1.2-6.tar.gz")`
		* _R:>>_`install.packages("vimcom_1.2-6.tar.gz",type="source",repos=NULL)`
	* tmux version should be > 1.6
	* do in R: `install.packages("~/.vim/bundle/VimCom", type = "source", repos = NULL)`
	* `ln -s ~/dotfiles/Rprofile ~/.Rprofile`
	* do in R: 
		* `download.file("http://www.lepem.ufc.br/jaa/vimr/colorout_1.1-1.tar.gz",
	              destfile = "colorout_1.1-1.tar.gz")`
		* `install.packages("colorout_1.1-1.tar.gz", type = "source", repos = NULL)`
		* `install.packages("setwidth")`
	* `ln -s ~/dotfiles/tmux.conf ~/.tmux.conf`

