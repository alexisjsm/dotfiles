#!/bin/bash
echo "Hola"
echo "primero actualizaremos el sistema"
sudo apt install update -y && sudo apt intall upgrade -y
echo "instalamos zsh firacode"
sudo apt install zsh fira-code-fonts -y

echo "instalamos volta"
curl https://get.volta.sh | bash
echo "instalando node y yarn"
~/.volta/bin/volta install node@lts yarn 

echo "instalando OH-MY-ZSH"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "instalando extensiones..."

echo "clonando zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "clonando zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "clonamos powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "nos movemos a .config"
cd ~/.config/

echo "clonamos dotfiles"
git clone https://github.com/alexisjsm/dotfiles.git

echo "enlanzamos"
ln -s ~/.config/dotfiles/.zshrc  ~/.zshrc
ln -s ~/.config/dotfiles/.zshrc  ~/.vimrc

echo "fin"
