------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1. How to Install and Run the Suite
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Before running the tests, install the following:
Python 3.x
Visual Studio Code (or any preferred IDE)
Google Chrome
Robot Framework
SeleniumLibrary
RequestsLibrary
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Install Dependencies:
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install selenium
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Executing the scripts:
For UI Happy Path   ---> py -m robot Scripts\UI_Script_Sample_Happy.robot
For UI Unhappy Path ---> py -m robot Scripts\UI_Script_Sample_Unappy.robot
For API             ---> py -m robot API\CRUD.robot
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. Tools Chosen and Why

I used Robot Framework for this assessment because it is the automation framework I currently use in my day-to-day work. I'm already familiar with its keyword-driven approach, which allows me to build test cases that are easy to read and maintain.

For the UI automation, I used SeleniumLibrary since it provides the browser interaction capabilities needed for the SauceDemo website. It was sufficient for automating the login, product selection, and checkout scenarios required by the assessment.

For the API portion, I used RequestsLibrary. It integrates well with Robot Framework and makes it straightforward to perform HTTP requests and validate responses. Since the API scenarios focused on CRUD operations, it was a good fit for the assessment.

I developed and executed the tests using Visual Studio Code, as it is the IDE I normally use for Robot Framework development.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What I Tested at the UI Layer Versus the API Layer

For the UI layer, I focused on the user's primary workflow. I automated a successful purchase from login through checkout, along with a negative login scenario using a locked-out user. These scenarios are best suited for UI automation because they verify that the application behaves correctly from the user's perspective and that the different pages work together as expected.

For the API layer, I tested the Create, Read, Update, and Delete operations, along with a negative scenario using an invalid object ID. These tests are more appropriate at the API level because they validate the application's backend behavior directly without relying on the user interface. API tests also execute faster and help isolate backend functionality from UI-related issues.

I chose this split because UI tests are more valuable for validating complete user journeys, while API tests are more efficient for verifying backend functionality and data operations.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4. What I Would Add or Change With More Time

If I had additional time, I would make the project more modular by separating reusable API keywords into their own resource files, similar to how larger automation frameworks are typically organized.

I would also add more test scenarios, particularly additional negative and boundary test cases, to improve coverage. For the UI tests, I would include validations for invalid checkout information and additional product scenarios.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. AI Tooling Usage

I used AI primarily as a learning and troubleshooting resource during the assessment. It helped me confirm my approach, answer questions about Robot Framework, and provide suggestions when I encountered issues.

I did not copy solutions without reviewing them. I tested the suggested approaches against the application and made changes where necessary. For example, I had to troubleshoot browser behavior, update locators, adjust synchronization using waits, and modify parts of the automation until the tests executed successfully.

The final solution reflects my own implementation and testing, with AI serving as a reference and debugging aid rather than replacing the development process.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------