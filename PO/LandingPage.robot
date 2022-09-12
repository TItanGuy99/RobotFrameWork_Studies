*** Settings ***
Documentation   All the page objects and keywords of landin page
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Keywords ***

Fill the login Form
    [arguments]    ${user_name}         ${password}
    Input Text          id:username     ${user_name}
    Input Password      id:password     ${password}
    Click Button        id:signInBtn

verify error message is correct
#    ${result}=   Get Text    ${Error_Message_Login}
#    Should Be Equal as Strings  ${result}   Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.