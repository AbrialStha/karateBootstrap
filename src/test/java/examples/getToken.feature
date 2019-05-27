@ignore
Feature: To sign-in to the App and get token once

  Scenario:
    * url burl
    * def credentials = { "client_id":"NOooasAeAIOaM6CoRMX1h5jSmjgeVIP3", "grant_type":"password", "username":'#(username)', "password":'#(password)', "audience":"http://extract-dev.fusemachines.com/", "scope":"openid"}

    Given path '/oauth/token'
    And header Accept = '*/*'
    And header Content-Type = 'application/json'
    And  request credentials
    When method post
    Then status 200
    And def token = 'bearer' + ' ' + response.access_token