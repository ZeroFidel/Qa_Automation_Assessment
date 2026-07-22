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
UI_Script_Sample_Happy
    [Documentation]    Verify that a standard user can successfully purchase an item.
    
    1. Open SauceDemo
    2. Login As Standard User
    3. Verify Products Page
    4. Add Backpack To Cart
    5. Open Shopping Cart
    6. Checkout Order
    7. Verify Successful Checkout
    8. Close Application

*** Keywords ***

1. Open SauceDemo
    [Documentation]    This keyword will open ${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Open Browser    ${URL}       Chrome    options=${options}
    Capture Page Screenshot    filename=Login.png

2. Login As Standard User
    [Documentation]    This keyword will login inside the website using the ff:
    ...    Username: ${STANDARD_USER}
    ...    Password: ${PASSWORD}
    Input Text        id=user-name       ${STANDARD_USER}
    Input Password    id=password        ${PASSWORD}
    Click Button      id=login-button
    Set Selenium Timeout            10 seconds
    Capture Page Screenshot    filename=User.png

3. Verify Products Page
    [Documentation]    This will check if we have successfully logged in
    Wait Until Element Is Visible    xpath=//span[text()="Products"]
    Capture Page Screenshot    filename=Homepage.png

4. Add Backpack To Cart
    [Documentation]    Adding the product: Backpack inside the cart
    Click Button        id=add-to-cart-sauce-labs-backpack
    Capture Page Screenshot    filename=Product.png

5. Open Shopping Cart
    [Documentation]    Opening the cart to see the added products
    Wait Until Element Is Visible    class=shopping_cart_link    10s
    Click Element                    class=shopping_cart_link
    Capture Page Screenshot          filename=Cart.png

6. Checkout Order
    [Documentation]    This keyword will checkout the ordered Product
    Click Button    id=checkout

    Input Text        id=first-name    ${FIRST_NAME}
    Input Text        id=last-name     ${LAST_NAME}
    Input Text        id=postal-code   ${ZIP_CODE}
    Capture Page Screenshot    filename=Name.png

    Click Button    id=continue
    Click Button    id=finish
    Capture Page Screenshot    filename=Checkout.png

7. Verify Successful Checkout
    [Documentation]    checking if the product has been successfuly bought
    Wait Until Element Is Visible
    ...    xpath=//h2[text()="Thank you for your order!"]
    Capture Page Screenshot    filename=Verification.png

8. Close Application
    Close Browser