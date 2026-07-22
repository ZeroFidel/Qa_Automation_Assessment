*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}        https://api.restful-api.dev
${OBJECT_NAME}     I am handsome
${UPDATED_NAME}    I am Ugly

*** Test Cases ***
API CRUD Test
    [Documentation]    Verify Create, Read, Update and Delete operations.

    Create Session    api    ${BASE_URL}

    # Create a new object
    ${request_body}=    Create Dictionary    name=${OBJECT_NAME}

    ${response}=    POST On Session
    ...    api
    ...    /objects
    ...    json=${request_body}

    Should Be Equal As Integers    ${response.status_code}    200

    ${response_body}=    Set Variable    ${response.json()}

    Should Be Equal    ${response_body["name"]}    ${OBJECT_NAME}

    ${object_id}=    Set Variable    ${response_body["id"]}

    Log To Console    Object created successfully. ID: ${object_id}

    # Retrieve the object
    ${response}=    GET On Session
    ...    api
    ...    /objects/${object_id}

    Should Be Equal As Integers    ${response.status_code}    200

    ${response_body}=    Set Variable    ${response.json()}

    Should Be Equal    ${response_body["name"]}    ${OBJECT_NAME}

    Log To Console    Retrieved object successfully.

    # Update the object
    ${request_body}=    Create Dictionary    name=${UPDATED_NAME}

    ${response}=    PUT On Session
    ...    api
    ...    /objects/${object_id}
    ...    json=${request_body}

    Should Be Equal As Integers    ${response.status_code}    200

    ${response_body}=    Set Variable    ${response.json()}

    Should Be Equal    ${response_body["name"]}    ${UPDATED_NAME}

    Log To Console    Object updated successfully.

    # Delete the object
    ${response}=    DELETE On Session
    ...    api
    ...    /objects/${object_id}

    Should Be Equal As Integers    ${response.status_code}    200

    # Verify the object is no longer available
    ${response}=    GET On Session
    ...    api
    ...    /objects/${object_id}
    ...    expected_status=404

    Should Be Equal As Integers    ${response.status_code}    404

    Log To Console    Object deleted successfully.

API Negative Test
    [Documentation]    Verify that an invalid object ID returns a 404 response.

    Create Session    api    ${BASE_URL}

    ${response}=    GET On Session
    ...    api
    ...    /objects/999999999999999999
    ...    expected_status=404

    Should Be Equal As Integers    ${response.status_code}    404

    Log To Console    Invalid object ID returned the expected 404 response.