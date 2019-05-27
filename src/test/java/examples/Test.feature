Feature: Add Job

  Background:
    * url 'https://extract-api-dev.fusemachines.com'
    * print baseUrl
    * print '>> token :: ', token

   Scenario: Create a w2 job

     Given path 'job/'
     And header Authorization = token
     And multipart file image = { read: 'classpath:w2.jpg', filename:'w2.jpg'}
     And multipart field job_name = 'abiral_w2_example_5'
     And multipart field reference_model_id = '5c6645b67f28bf3b5d4662bb'
     When method post
     Then status 200
     * print response

