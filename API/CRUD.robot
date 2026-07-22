*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}      https://api.restful-api.dev
${OBJECT_NAME}   I am handsome

*** Test Cases ***
API CRUD Test
    [Documentation]    Verify Create, Read, Update, and Delete operations.

    # Create API Session
    Create Session    api    ${BASE_URL}

    # -------------------------
    # CREATE
    # -------------------------
    ${body}=    Create Dictionary    name=${OBJECT_NAME}

    ${create_response}=    POST On Session
    ...    api
    ...    /objects
    ...    json=${body}

    Should Be Equal As Integers
    ...    ${create_response.status_code}
    ...    200

    ${create_json}=    Set Variable    ${create_response.json()}

    Should Be Equal
    ...    ${create_json["name"]}
    ...    ${OBJECT_NAME}

    ${OBJECT_ID}=    Set Variable
    ...    ${create_json["id"]}

    Log To Console
    ...    Created Object ID: ${OBJECT_ID}

    # -------------------------
    # READ
    # -------------------------
    ${get_response}=    GET On Session
    ...    api
    ...    /objects/${OBJECT_ID}

    Should Be Equal As Integers
    ...    ${get_response.status_code}
    ...    200

    ${get_json}=    Set Variable
    ...    ${get_response.json()}

    Should Be Equal
    ...    ${get_json["name"]}
    ...    ${OBJECT_NAME}

    # -------------------------
    # UPDATE
    # -------------------------
    ${update_body}=    Create Dictionary
    ...    name=I am Ugly

    ${update_response}=    PUT On Session
    ...    api
    ...    /objects/${OBJECT_ID}
    ...    json=${update_body}

    Should Be Equal As Integers
    ...    ${update_response.status_code}
    ...    200

    ${update_json}=    Set Variable
    ...    ${update_response.json()}

    Should Be Equal
    ...    ${update_json["name"]}
    ...    I am Ugly

    # -------------------------
    # DELETE
    # -------------------------
    ${delete_response}=    DELETE On Session
    ...    api
    ...    /objects/${OBJECT_ID}

    Should Be Equal As Integers
    ...    ${delete_response.status_code}
    ...    200

API Negative Test
    [Documentation]    Verify requesting a non-existent object returns 404.

    Create Session    api    ${BASE_URL}

    ${response}=    GET On Session
    ...    api
    ...    /objects/999999999999999999
    ...    expected_status=404

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    404