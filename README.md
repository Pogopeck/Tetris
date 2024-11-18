# Setting up EC2



# Update system
sudo yum update -y

# Install Python and development tools
sudo yum install python3 python3-pip python3-devel -y

# Install git
sudo yum install git -y

# Create application directory
mkdir ~/tetris
cd ~/tetris

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Make startup script executable
chmod +x startup.sh

# Set up the service to run automatically: Create a systemd service file:
sudo vi /etc/systemd/system/tetris.service
and add below content:
[Unit]
Description=Tetris Game Server
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user/tetris
ExecStart=/home/ec2-user/tetris/venv/bin/gunicorn -b 0.0.0.0:8080 app:app
Restart=always

[Install]
WantedBy=multi-user.target


