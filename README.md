# Alt Fuel Finder

Simple app to view alternative fuel stations within 6 miles of a given zip code, limited to 10 results. Completed in a 2 hr period as a mid-mod assessment for mod 3 at Turing. 

It uses the NREL alternative fuel station API data found (here)[https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/]. 

## Setup

```
$ bundle install
$ rake db:{create,migrate}
$ rails s
```

Navigate to `http://localhost:3000`

## Tech

1. Rails
1. Faraday to make API requests
1. VCR to record request data to avoid making real API calls during each test

## Testing

Testing is done with rspec and tests the station model, facade, service, and view. It utilizes feature and model testing.

To run tests:
```
bundle exec rspec
```

## User Story
As a user
When I visit "/"
And I fill in the search form with 80203 (Note: Use the existing search form)
And I click "Locate"
Then I should be on page "/search"
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times