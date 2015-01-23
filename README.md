# Hair Salon
Allows the user to add hair stylists and their clients.
## Setup Instructions:
### Gems Used:
```
sinatra
sinatra-contrib
pg
```
### Install Bundler:
```
$ gem install bundler
```
### Run Bundler:
```
$ bundle
```
### Start the database:
```
$ postgres
```
### Create database:
```
$ psql
# CREATE DATABASE hair_salon;
# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```
### Bug Reports
Zarro Boogs
### Author
Alex Kaufman
#### MIT License
