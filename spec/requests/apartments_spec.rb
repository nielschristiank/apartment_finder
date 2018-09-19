require 'rails_helper'

describe "Apartments API" do
  it "gets a list of Apartments" do
    # Create a new apartment in the Test Database (not the same one as development)
    Apartment.create(address_1: '300 Blah St.', address_2: '#400', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Fred', building_manager_phone: 15556782345, building_manager_hours: 'Mon-Fri: 8AM-5PM')
    # Make a request to the API
    get '/apartments'
    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)
    # Assure that we got a successful response
    expect(response).to be_success
    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "can create an apartment" do
    apartment_params = {
      apartment: {
        address_1: '300 Blah St.',
        address_2: '#400',
        city: 'San Diego',
        postal_code: '92101',
        state: 'CA',
        country: 'USA',
        building_manager_name: 'Fred',
        building_manager_phone: 15556782345,
        building_manager_hours: 'Mon-Fri: 8AM-5PM'
      }
    }

    post '/apartments', params: apartment_params
    json=JSON.parse(response.body)
    expect(response).to be_success
    new_apartment = Apartment.first
    expect(new_apartment.address_1).to eq('300 Blah St.')
  end

end
