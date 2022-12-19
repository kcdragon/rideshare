#!/usr/bin/env ruby

require 'rubygems'
require 'faraday'
require 'json'

# - run simulation_bootstrap rake task
#
#
# Steps in end-to-end cycle
# 1. (API) Rider creates trip_request
# 1. (API) Rider polls for trip_request status
# 1. Best available driver pickes up trip request, updates status, trip created
# 1. (API) Rider polls for trip status
# 1. Driver completes trip


url = 'http://localhost:3000/api/trip_requests'
request_body = {
  trip_request: {
    rider_id: 1,
    start_address: 'Boston, MA',
    end_address: 'New York, NY'
  }
}
request_headers = {
  'Accept' => 'application/json'
}
response = Faraday.post(url, request_body, request_headers)
resp = JSON.parse(response.body, symbolize_names: true)
puts resp