#!usr/bin
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings
echo "setting sources"
sudo apt install software-properties-common
sudo add-apt-repository universe
echo "Now add the ROS 2 GPG key with apt."
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "Then add the repository to your sources list."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

echo "Installing ROS 2 packages"
sudo apt update
sudo apt upgrade
sudo apt install ros-foxy-desktop python3-argcomplete
sudo apt install ros-dev-tools
echo "Testing Installlation"
# Replace ".bash" with your shell if you're not using bash
# Possible values are: setup.bash, setup.sh, setup.zsh
source /opt/ros/foxy/setup.bash
ros2 run demo_nodes_cpp talker

echo "Checking if pip3 is installed..."
if ! command -v pip3 &> /dev/null; then
    echo "pip3 could not be found"
    echo "Installing pip3..."
    sudo apt install -y python3-pip
fi

echo "Installing PyTorch..."
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip3 install stable-baselines3[extra]

echo "ROS 2 Foxy and PyTorch installation completed."

echo "Checking if Neovim is installed..."
if ! command -v nvim &> /dev/null; then
    echo "Neovim could not be found"
    echo "Installing Neovim..."
    sudo snap install nvim --classic
fi

echo "Installing chad vim "
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

echo "DONEEEEEEE ...................."
echo "Author: github.com/kuldeepaher01"
