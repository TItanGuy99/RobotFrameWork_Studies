*** Settings ***
Documentation   To validate the Login form
Library         SeleniumLibrary
Library         String
Library         Collections
Test Setup      open the browser with the url
Test Teardown    close browser
Resource        ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
Validate Child windows Funcionality
    [TAGS]    SMOKE
    Select the link of Child windows
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child windows
    click element       css:.blinkingText
    sleep               5

Verify the user is Switched to Child window
    switch window       NEW
    element text should be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text} at
    ${text_split}=      Get From List   ${words}   1
    @{words2}=   Split String    ${text_split}
    ${email}=      Get From List   ${words2}   0
    set global variable    ${email}

Switch to Parent window and enter the Email
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id:username     ${email}