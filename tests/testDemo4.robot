*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Test Teardown   close browser
Test Template   Validate UnSucessful Login
#   Resource
#   selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***      username        password
Invalid username        dsahed          learning
Invalid password        invalidname     prudfg
special characters      @123            learning

*** Keywords ***
Validate UnSucessful Login
    [arguments]    ${username}  ${password}
    open the browser with the Mortgage payment url
    Fill the login Form     ${username}  ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:/chromedriver_win32/chromedriver
    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [arguments]         ${username}  ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        id:signInBtn

wait until it checks and display error message
    wait until element is visible    ${Error_Message_Login}

verify error message is correct
#    ${result}=   Get Text    ${Error_Message_Login}
#    Should Be Equal as Strings  ${result}   Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.

