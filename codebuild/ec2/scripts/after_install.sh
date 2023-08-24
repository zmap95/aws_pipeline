#!/bin/bash
echo "After install batch !"
sudo chown -R ubuntu:www-data /var/www/html && \
sudo supervisorctl reload