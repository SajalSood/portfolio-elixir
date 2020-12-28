
#!/bin/bash

cd /var/www/portfolio/
touch /etc/systemd/system/portfolio.service
echo "[Unit]" > /etc/systemd/system/portfolio.service
echo "Description=Portfolio Service" >> /etc/systemd/system/portfolio.service
echo "After=network.target" >> /etc/systemd/system/portfolio.service
echo "[Service]" >> /etc/systemd/system/portfolio.service
echo "ExecStart=mix serum.server --port 80" >> /etc/systemd/system/portfolio.service
echo "WorkingDirectory=/var/www/portfolio/" >> /etc/systemd/system/portfolio.service
echo "User=root" >> /etc/systemd/system/portfolio.service
echo "Group=root" >> /etc/systemd/system/portfolio.service
echo "EnvironmentFile=/etc/environment/" >> /etc/systemd/system/portfolio.service
echo "[Install]" >> /etc/systemd/system/portfolio.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/portfolio.service
systemctl daemon-reload
systemctl start portfolio
systemctl enable portfolio