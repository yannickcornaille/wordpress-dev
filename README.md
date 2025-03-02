# wordpress-dev
A local/development Wordpress environment to peacefully prepare your future website.

## Prerequisites
- Docker
- Docker-compose

## Usage
Clone the repository and navigate to the project directory:
```bash
git clone <repository-url>
cd wordpress-dev
```

Make the script executable:
```bash
chmod +x wp-dev.sh
```

## Available scripts
The `wp-dev.sh` script provides several commands to manage your local Wordpress environment:

### Start the environment
```bash
./wp-dev.sh up
```
This command starts the Wordpress environment using Docker-compose.

### Stop the environment and backup the database
```bash
./wp-dev.sh down
```
This command creates a backup of the database and stops the Wordpress environment.

### Backup the database
```bash
./wp-dev.sh backup
```
This command creates a backup of the database without stopping the environment.

### Restore the database
```bash
./wp-dev.sh restore
```
This command restores the database from the backup file.

## Notes
- Ensure Docker and Docker-compose are installed and running on your system. Personally I use [Rancher Desktop](https://rancherdesktop.io/).
- Modify the database credentials and other configurations in the `wp-dev.sh` script as needed.
