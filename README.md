# wordpress-dev
A local/development Wordpress environment to peacefully prepare your future website.

A need to develop your WordPress site without updating your production environment, visible to all, and you do not have a test/staging environment with your web hosting.
Use this repository to run a local environment with Docker, and once ready, put your site online thanks to the included database backup feature and the wordpress folder.

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

Copy the example environment file and customize it:
```bash
cp .env.example .env
```
Edit the `.env` file to set your own database credentials and other configurations.

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
- Modify the database credentials and other configurations in the `.env` file as needed.
