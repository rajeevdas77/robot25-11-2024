*** Settings ***

Library     SeleniumLibrary
Test Setup      Open Browser And Navigate
Test Teardown     Close Browser




*** Variables ***
${URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome
${USERNAME}     Admin
${PASSWORD}     admin123

*** Test Cases ***
Valid Login Test
    [Documentation]     Verify the valid login test
    Sleep               3 second
    Input Text          xpath: //input[@name='username']       ${USERNAME}
    Sleep               3 second
    Input Text          xpath: //input[@name='password']       ${PASSWORD}
    Click Button        xpath: //button[@type="submit"]
    Sleep               3 second
    Wait Until Element Is Visible       xpath://*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[8]/a/span
    Element Should Be Visible       xpath://span[text()=("Dashboard")]


Invalid Login Test
    [Documentation]    Test to validate unsuccessful login with invalid credentials.
    Sleep               3 second
    Input Text    xpath://input[@name='username']    invalid_user
    Input Text    xpath://input[@name='password']    invalid_password
    Click Button  xpath://button[@type='submit']
    Sleep               3 second
    Wait Until Element Is Visible    xpath://p[contains(text(),'Invalid credentials')]
    Element Should Contain           xpath://p[contains(text(),'Invalid credentials')]


*** Keywords ***
Open Browser And Navigate
    Open Browser        ${URL}      ${BROWSER}
    Maximize Browser Window





#*** Settings ***
#Library           SeleniumLibrary
##Library           RPA.Excel.Files    # If needed to fetch data from external sources
#Test Setup        Open Browser And Navigate
#Test Teardown     Close Browser
#
#*** Variables ***
#${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
#${BROWSER}        Chrome
#${USERNAME}       Admin
#${PASSWORD}       admin123
#
#*** Test Cases ***
#Valid Login Test
#    [Documentation]    Test to validate successful login to OrangeHRM.
#    Input Text    xpath://input[@name='username']    ${USERNAME}
#    Input Text    xpath://input[@name='password']    ${PASSWORD}
#    Click Button  xpath://button[@type='submit']
##    Wait Until Element Is Visible    xpath://h6[text()='Dashboard']
##    Element Should Be Visible        xpath://h6[text()='Dashboard']
#
##Invalid Login Test
##    [Documentation]    Test to validate unsuccessful login with invalid credentials.
##    Input Text    xpath://input[@name='username']    invalid_user
##    Input Text    xpath://input[@name='password']    invalid_password
##    Click Button  xpath://button[@type='submit']
##    Wait Until Element Is Visible    xpath://p[contains(text(),'Invalid credentials')]
##    Element Should Contain           xpath://p[contains(text(),'Invalid credentials')]    Invalid credentials
#
#*** Keywords ***
#Open Browser And Navigate
#    Open Browser    ${URL}    ${BROWSER}
#    Maximize Browser Window
