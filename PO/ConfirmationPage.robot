*** Settings ***
Documentation   All the page objects and keywords of landin page
Resource        ../PO/Generic.robot
Library         SeleniumLibrary
Library         OperatingSystem

*** Keywords ***

Enter the Country and select the terms
    [arguments]      ${country_name}
    input text      country     ${country_name}
    sleep               5
    Generic.wait until element is located in the page       //a[text()='${country_name}']
    click element       //a[text()='${country_name}']
    sleep               2
    click element       css:.checkbox label

Purchase the Product and Confirm the Purchase
    click button    css:.btn-success
    page should contain    Success!