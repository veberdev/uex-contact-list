## Description
* This app uses Ruby 3.0.0 and Rails ~> 7.0.8.4

* The API enables users to manage a contact list with automatic geolocation integration.
* It utilizes the ViaCEP API to retrieve address details based on zip codes. 

## Usage Instructions

#### rails db:seed will create a user with 10 contacts associated:

`email/login: admin@admin.com`  
`password: admin`

#### The project uses Rspec for testing. To run it run in the root project:

`bundle exec rspec` It will run all the test suite.

#### it uses google geolocalization API

create your own and add as `GOOGLE_MAPS_API_KEY`, which will result in `ENV['GOOGLE_MAPS_API_KEY']` for use
  
## Api documentation:
Explore the `API endpoints` and usage instructions on [Postman Documentation.](https://documenter.getpostman.com/view/5603221/2sA3kPoizL)
