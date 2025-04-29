#!/bin/bash
echo "Running Mahalaksh Money Server Setup (v1)..."

# Update
sudo apt update -y && sudo apt upgrade -y

# Install essentials
sudo apt install -y nginx docker.io curl ufw

# Enable & start services
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable docker
sudo systemctl start docker

# Allow firewall
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

# Create welcome HTML
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Welcome to Mahalaksh Money</title>
  <style>
    body {
      margin: 0;
      background: #0a0f2c;
      color: white;
      font-family: 'Segoe UI', sans-serif;
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      height: 100vh;
    }
    h1 {
      font-size: 3rem;
      animation: glow 1.5s infinite alternate;
    }
    @keyframes glow {
      from { text-shadow: 0 0 10px #fff; }
      to { text-shadow: 0 0 20px #0ff, 0 0 30px #0ff; }
    }
  </style>
</head>
<body>
  <h1>Welcome to Mahalaksh Money</h1>
  <p>The Future of Auto Trading Starts Here</p>
</body>
</html>
EOF

# Done
echo "Setup Completed Successfully!"
