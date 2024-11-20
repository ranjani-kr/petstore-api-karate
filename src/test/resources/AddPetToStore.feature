    Feature: Add pet to the store using API

    Background:
        # Set the base URL for all scenarios
        * url 'https://petstore.swagger.io/v2'
        * def petId = Math.floor(Math.random() * 10000)
        * def name = 'Pet_${petId}'
        * def photoUrls = ['https://example.com/photo1.jpg']
        * def status = 'available'
        * def fullPetData =
            """
            {
              "id": "#(petId)",
              "category": {
                "id": 1,
                "name": "Dog"
              },
              "name": "Pet_#(petId)",
              "photoUrls": [
                "https://example.com/photo1.jpg"
              ],
              "tags": [
                {
                  "id": 1,
                  "name": "Friendly"
                }
              ],
              "status": "available"
            }
            """

    Scenario: Successfully able to add the pet with all the mandatory fields
        Given path 'pet'
        And request { id: '#(petId)', name: '#(name)',status : '#(status)', photoUrls: '#(photoUrls)' }
        When method POST
        Then status 200
        And match response.id == petId
        And match response.name == name
        And match response.photoUrls == photoUrls
        And match response.status == status


    Scenario: Should be able to add pet with all the fields
        Given path 'pet'
        And request fullPetData
        When method POST
        Then status 200
        And match response.id == fullPetData.id
        And match response.name  ==  fullPetData.name
        And match response.status == fullPetData.status
        And match response.photoUrls ==  fullPetData.photoUrls
        And match response.category.id == fullPetData.category.id
        And match response.category.name == fullPetData.category.name
        And match response.tags[0].name == fullPetData.tags[0].name
         * print 'Response Body:', response

    Scenario: Should return 400 when pet with invalid data is added
        Given path 'pet'
        And request { id: 'invalid_id', name : '#(name)', status: '#(status)', photoUrls: '#(photoUrls)'}
        When method POST
        Then status 500

    Scenario: Should return 405 when invalid request is used

    Scenario: Able to add multiple photo urls
    Scenario: should not be allowed to add more than 5 photos
    Scenario : verify if photo url is of valid format














