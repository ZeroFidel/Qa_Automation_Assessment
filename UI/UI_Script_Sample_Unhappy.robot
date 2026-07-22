*** Settings ***
Test Tags        Assessment    UI    Happy Path    Sad Path
Library        SeleniumLibrary

*** Variables ***

${URL}                 https://www.saucedemo.com
${BROWSER}             Chrome
${STANDARD_USER}       standard_user
${PASSWORD}            secret_sauce
${FIRST_NAME}          Bryan
${LAST_NAME}           Bati-on
${ZIP_CODE}            1118

*** Test Cases ***
UI_Script_Sample_Sad
    [Documentation]    This test case will simple login and order a backpack inside the website but an error will occur.

    1. Open SauceDemo
    2. Input A Wrong Credential

*** Keywords ***
1. Open SauceDemo
    [Documentation]    This keyword will open ${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Open Browser    ${URL}       Chrome    options=${options}

2. Input A Wrong Credential
    [Documentation]    This keyword will try to input a wrong data in the credentials
    Input Text        id=user-name    ${STANDARD_USER}
    Input Password    id=password     123456
    Click Button      id=login-button
    Element Text Should Be
    ...    xpath=//h3[@data-test='error']
    ...    Epic sadface: Username and password do not match any user in this service