#!/bin/bash
echo "Hola"
echo "primero actualizaremos el sistema"
sudo apt update -y && sudo apt upgrade -y
sleep 5

echo "instalamos zsh"
sudo apt install zsh -y
sleep 10
echo "agregando zsh como interprete por defecto"
chsh -s $(which zsh) $USER
sleep 10

echo "instalamos volta"
curl https://get.volta.sh | bash

echo "instalando node y yarn"
~/.volta/bin/volta install node@lts

sleep 5

echo "instalando OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 5

echo "instalando extensiones..."
sleep 5
echo "clonando zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 5
echo "clonando zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 5
echo "clonamos powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sleep 5

echo "comprobando carpeta .config"
if [ ! -d ~/.config ]; then
		echo "creando .config"
		mkdir ~/.config
fi

echo "nos movemos a .config"
cd ~/.config/

echo "clonamos dotfiles"
git clone https://github.com/alexisjsm/dotfiles.git

sleep 5

echo "enlazando .zshrc"
ln -sf ~/.config/dotfiles/.zshrc  ~/.zshrc
sleep 5
echo "enlazando .vimrc"
ln -sf ~/.config/dotfiles/.vimrc  ~/.vimrc
sleep 5
echo "enlazando p10k"
ln -sf ~/.config/dotfiles/.p10k.zsh ~/.p10k.zsh
sleep 5
echo "fin"
