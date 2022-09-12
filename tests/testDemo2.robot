*** Settings ***
Documentation   To validade the Login form
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser with the url
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link

*** Test Cases ***
Validate UnSucessful Login
    [Tags]  SMOKE
    Fill the login Form     ${user_name}    ${invalid_password}
    wait until element is located in the page       ${Error_Message_Login}
    verify error message is correct

validade Cards display in the Shipping Page
    Fill the login Form     ${user_name}    ${valid_password}
    wait until element is located in the page       ${Shop_page_load}
    Verify card titles in the Shop page
    Select the Card     Blackberry

Select the Form and navigate to Child window
    fill the Login Details and Form

*** Keywords ***

Fill the login Form
    [arguments]    ${user_name}         ${password}
    Input Text          id:username     ${user_name}
    Input Password      id:password     ${password}
    Click Button        id:signInBtn

wait until element is located in the page
    [arguments]    ${element}
    wait until element is visible    ${element}

verify error message is correct
#    ${result}=   Get Text    ${Error_Message_Login}
#    Should Be Equal as Strings  ${result}   Incorrect username/password.
    element text should be  ${Error_Message_Login}  Incorrect username/password.

Verify card titles in the Shop page
    @{expectedList} =       create list    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements    css:.card-title
    @{actualList} =   Create List

    FOR    ${element}   IN    @{elements}
        Log     ${element.text}
        Append To List      ${actualList}   ${element.text}
    END

    lists should be equal       ${expectedList}     ${actualList}

Select the Card
    [arguments]     ${cardName}
    ${elements} =   Get WebElements    css:.card-title
    ${index} =   Set Variable   1
    FOR    ${element}   IN    @{elements}
        Exit For Loop IF    "${cardName}" == "${element.text}"
            ${index}=   Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

fill the Login Details and Form

    Input Text          id:username     rahulshettyacademy
    Input Password      id:password     learning
    click element       css:input[value='user']
    wait until element is visible    css:.modal-body
    click button       id:okayBtn
    wait until element is not visible    css:.modal-body
    select from list by value    css:select.form-control    teach
    select checkbox    terms
    checkbox should be selected    terms





