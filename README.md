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
1. Install vim > 7.4: `sudo apt-get install vim`
2. Install r > 3.0 
	* `echo 'deb http://healthstat.snu.ac.kr/CRAN/bin/linux/ubuntu trusty/' | sudo tee -a /etc/apt/sources.list`
	* `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9`
	* `sudo apt-get update`
	* `sudo apt-get install r-base`
	* `sudo apt-get install r-base-dev` (to use 'install.packages()')
3. Install tmux.
4. Install vimcom = 1.2-6
		* `audo apt-get install libx11-dev`
		* _R:>>_`download.file("http://www.lepem.ufc.br/jaa.vimr/vimcom_1.2-6.tar.gz",destfile="vimcom_1.2-6.tar.gz")`
		* _R:>>_`install.packages("vimcom_1.2-6.tar.gz",type="source",repos=NULL)`
		* `ln -s ~/dotfiles/Rprofile ~/.Rprofile`
5. Install vim-r-plugin

	* do in R: 
		* `download.file("http://www.lepem.ufc.br/jaa/vimr/colorout_1.1-1.tar.gz",
	              destfile = "colorout_1.1-1.tar.gz")`
		* `install.packages("colorout_1.1-1.tar.gz", type = "source", repos = NULL)`
		* `install.packages("setwidth")`
