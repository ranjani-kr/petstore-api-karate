Feature: CRUD operations on Petstore API

  Background:
    # Set the base URL for all scenarios
    * url 'https://petstore.swagger.io/v2'
    * def petId = 123456 // Use a specific ID to easily find and delete later

  Scenario: Create a new pet
    Given path 'pet'
    And request { id: '#(petId)', name: 'Buddy', status: 'available' }
    When method POST
    Then status 200
    And match response.id == petId
    And match response.name == 'Buddy'
    And match response.status == 'available'

  Scenario: Retrieve the created pet
    Given path 'pet', petId
    When method GET
    Then status 200
    And match response.id == petId
    And match response.name == 'Buddy'
    And match response.status == 'available'

  Scenario: Update the pet's status
    Given path 'pet'
    And request { id: '#(petId)', name: 'Buddy', status: 'sold' }
    When method PUT
    Then status 200
    And match response.id == petId
    And match response.status == 'sold'

  Scenario: Delete the pet
    Given path 'pet', petId
    When method DELETE
    Then status 200

  Scenario: Confirm the pet has been deleted
    Given path 'pet', petId
    When method GET
    Then status 404