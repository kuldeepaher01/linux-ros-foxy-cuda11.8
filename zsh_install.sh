# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo."
  exit 1
fi
sudo apt update
sudo apt upgrade
echo "Installing utilities"
sudo apt install -y curl git wget xclip
echo "installing zsh"
sudo apt install -y zsh
echo "setting up ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing plugins"
git clone git@github.com:zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git@github.com:romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

sed -i '/plugins=\(\)/c\plugins=(zsh-autosuggestions git zsh-syntax-highlighting copypath history sudo encode64)' .zshrc
sed -i '/ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' .zshrc
