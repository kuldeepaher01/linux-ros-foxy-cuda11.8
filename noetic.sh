if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo."
  exit 1
fi
echo "Checking if pip3 is installed..."
if ! command -v pip3 &> /dev/null; then
    echo "pip3 could not be found"
    echo "Installing pip3..."
    sudo apt install -y python3-pip
fi
echo "Setting up sources for noetic"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

echo "Installation Phase ...."

sudo apt update
sudo apt install -y ros-noetic-desktop-full


echo "Setting up environment variables..."
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
# source ~/.zshrc

echo "Installing rosdep..."
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
echo "Checking if VSCode is installed..."
if ! command -v code &> /dev/null; then
    echo "VSCode could not be found"
    echo "Installing VSCode..."
    sudo snap install code --classic
fi
echo "Installation Complete"