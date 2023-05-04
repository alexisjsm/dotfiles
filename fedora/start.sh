#!/bin/bash
echo "Hola"
echo "primero actualizaremos el sistema"
sudo dnf upgrade --refresh -y 
sleep 5

echo "instalamos zsh y firacode"
sudo dnf install zsh util-linux-user fira-code-fonts -y
sleep 3

echo "agregando zsh como interprete por defecto"
chsh -s $(which zsh)
sleep 3

echo "instalamos volta"
curl https://get.volta.sh | bash

echo "instalando node y yarn"
~/.volta/bin/volta install node@lts yarn 
sleep 3

echo "instalando OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 3

echo "haciendo zsh por defecto"
chsh -s $(which zsh)

echo "instalando extensiones..."

echo "clonando zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "clonando zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "clonamos powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sleep 3

echo "nos movemos a .config"
cd ~/.config/

echo "clonamos dotfiles"
git clone https://github.com/alexisjsm/dotfiles.git

echo "borrado por defecto"
rm ~/.zshrc
sleep 3

echo "enlanzamos"
ln -s ~/.config/dotfiles/.zshrc  ~/.zshrc
ln -s ~/.config/dotfiles/.vimrc  ~/.vimrc
ln -s ~/.config/dotfiles/.p10k.zsh ~/.p10k.zsh
echo "fin"
