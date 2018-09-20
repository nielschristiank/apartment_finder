require 'rails_helper'

describe "Apartments API" do
  before do
    @apartment = Apartment.create(address_1: '300 Blah St.', address_2: '#400', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Fred', building_manager_phone: 15556782345, building_manager_hours: 'Mon-Fri: 8AM-5PM')
    @apartment2 = Apartment.create(address_1: '123 Greg St.', address_2: '#400', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Bob', building_manager_phone: 15556782345, building_manager_hours: 'Mon-Fri: 8AM-5PM')
  end

  #TEST index to show apartments
  it "gets a list of Apartments" do
    # Create a new apartment in the Test Database (not the same one as development)
    #Apartment.create(address_1: '300 Blah St.', address_2: '#400', city: 'San Diego', postal_code: '92101', state: 'CA', country: 'USA', building_manager_name: 'Fred', building_manager_phone: 15556782345, building_manager_hours: 'Mon-Fri: 8AM-5PM')
    # Make a request to the API
    get '/apartments'
    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)
    # Assure that we got a successful response
    expect(response).to be_success
    # Assure that we got one result back as expected
    expect(json.length).to eq 2
  end

  #TEST to create an apartment entry
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

  #TEST validation
  it "should validate address_1, city, state, postal_code, country" do
    apartment = Apartment.create
    expect(apartment.errors[:address_1]).to_not be_empty
    expect(apartment.errors[:city]).to_not be_empty
    expect(apartment.errors[:state]).to_not be_empty
    expect(apartment.errors[:postal_code]).to_not be_empty
    expect(apartment.errors[:country]).to_not be_empty
    expect(apartment.errors[:address_2]).to be_empty
  end

  #TEST to show one apartment
  it "can show a specific apartment by ID" do
    id = @apartment.id
    get "/apartments/#{id}"
    json=JSON.parse(response.body)
    expect(response).to be_success
    #expect(response.address_1).to eq('300 Blah St.')
  end

  #TEST to update an apartment
  #TEST to update an apartment
it "can update an apartment" do
  id = @apartment.id
  new_params = {
    apartment: {
      # address_1: '300 Blah St.',
      # address_2: '#400',
      # city: 'San Diego',
      # postal_code: '92101',
      # state: 'CA',
      country: 'Norway',
      building_manager_name: 'Albert',
      # building_manager_phone: 15556782345,
      # building_manager_hours: 'Mon-Fri: 8AM-5PM'
    }
  }
  patch "/apartments/#{id}", params: new_params
  expect(response).to be_success
  json=JSON.parse(response.body)
  p json
  p json['building_manager_name']
  p json['country']
  expect(json['building_manager_name']).to eq('Albert')
  expect(json['country']).to eq('Norway')
end

  #TEST to destroy an apartment
  it "can delete an apartment" do
    get "/apartments"
    json=JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq 2
    delete "/apartments/#{@apartment.id}"
    get "/apartments"
    json=JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq 1
  end



end
