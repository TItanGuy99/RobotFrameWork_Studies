*** Settings ***
Documentation   To validade the Login form
Library         SeleniumLibrary
Library         Collections
Library         ../customLibraries/Shop.py
Test Setup      open the browser with the url
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/ConfirmationPage.robot

*** Variables ***
@{listofProducs}    Nokia Edge  Blackberry
@{countryName}      India
${Shop_page_load}       css:.nav-link

*** Test Cases ***
validade Cards display in the Shipping Page
    [Tags]  SMOKE
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    Generic.wait until element is located in the page   ${Shop_page_load}
    ShopPage.Verify card titles in the Shop page
    add items to cart and checkout      ${listofProducs}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      @{countryName}
    ConfirmationPage.Purchase the Product and Confirm the Purchase




