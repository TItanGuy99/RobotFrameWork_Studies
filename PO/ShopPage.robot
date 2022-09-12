*** Settings ***
Documentation   All the page objects and keywords of landin page
Library         SeleniumLibrary
Library         OperatingSystem

*** Keywords ***

Verify card titles in the Shop page
    @{expectedList} =       create list    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements    css:.card-title
    @{actualList} =   Create List

    FOR    ${element}   IN    @{elements}
        Log     ${element.text}
        Append To List      ${actualList}   ${element.text}
    END

    lists should be equal       ${expectedList}     ${actualList}