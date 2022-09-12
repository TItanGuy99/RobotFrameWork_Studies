*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Test Teardown    close browser
#   Resource
#   selenium

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate UnSucessful Login
    open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Firefox  executable_path=C:/webdrivers/Firefox
    Go To               https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     12345678
    Click Button        id:signInBtn

wait until it checks and display error message
    wait until element is visible    ${Error_Message_Login}

verify error message is correct
#    ${result}=   Get Text    ${Error_Message_Login}
#    Should Be Equal as Strings  ${result}   Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.

