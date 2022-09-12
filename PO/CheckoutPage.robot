*** Settings ***
Documentation   All the page objects and keywords of landin page
Library         SeleniumLibrary
Library         OperatingSystem

*** Keywords ***

Verify items in the Checkout Page and proceed
    click element    css:.btn-success