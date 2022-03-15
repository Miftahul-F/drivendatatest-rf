*** Settings ***
Library                     SeleniumLibrary
Library                     DataDriver     ../Resources/credentials.csv                    sheet_name=Sheet1
Suite Setup                 Open Browser                    ${webURL}                       ${BROWSERS}
Suite Teardown              Close Browser
Test Template               I login with invalid username and invalid password

*** Variables ***
${webURL}                   https://www.saucedemo.com/                        
${BROWSERS}                 chrome

*** Keywords ***
I login with invalid username and invalid password
    Maximize Browser Window
    [Arguments]             ${username}                                 ${password}
    Input Text              //input[@data-test="username"]              ${username} 
    Input Text              //input[@id="password"]                     ${password}
    Click Element           //input[@id="login-button"] 
    Page Should Contain                                                 Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Login with invalid username and invalid password using CSV File         ${username}                     ${password}

