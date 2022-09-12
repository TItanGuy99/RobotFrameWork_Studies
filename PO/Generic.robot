*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         OperatingSystem

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     12345678
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${browser_name}         Firefox

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Firefox  executable_path=C:/webdrivers/Firefox
    Go To               ${url}

open the browser with the url
    Create Webdriver    ${browser_name}  executable_path=C:/webdrivers/${browser_name}
    Go To               ${url}

Close Browser session
    close browser

wait until element is located in the page
    [arguments]      ${element}
    wait until element is visible    ${element}