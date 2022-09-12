*** Settings ***
Library     RequestLibrary
Library     Collections

*** Variables ***
${base_url}     https://rahulshettyacademy.com
${book_id}
${book_name}    RobotFramework

*** Test Cases ***

Play around with Dictionary
    &{data}=    create dictionary    name=rahulshetty   course=robot    website=rahushettyacademy.com
    log    ${data}
    Dictionary Should Contain Key   ${data}     name
    log    ${data}[name]
    ${url}=     get from dictionary    ${data}     website
    log    ${url}

Add Book into Library DataBase
    [Tags]      API
    &{req_body}=     create dictionary    name=${book_name}    isbn=984353 aisle=324353    author=nai
    ${response}=    POST        ${base_url}/Library/Addbook.php     json=${req_body}    expected_status=200
    log     ${response.json()}
    dictionary should contain key    ${response.json()}     ID
    ${book_id}=     get from dictionary    ${response.json()}     ID
    Set Global Variable     ${book_id}
    log    ${book_id}
    Should be equal as strings      successfully added      ${response.json()}[Msg]
    status should be    200     ${response}

Get the Book Details which got added
    [Tags]      API
    ${get_response}=    GET     ${base_url}/Library/GetBook.php     params=ID=${book_id}    expected_status=200
    log     ${get_response.json()}
    should be equal as strings    ${book_name}      ${get_response.json()}[0][book_name]

Delete the book from database
        [Tags]      API
        &{delete_req}=   CREATE DICTIONARY       ID=${book_id}
        ${delete_resp}=     POST        ${base_url}/Library/DeleteBook.php     json=${delete_req}       expected_status=200
        log    ${delete_resp.json()}[msg]
        should be equal as strings      book is successfully deleted        ${delete_resp.json()}[msg]















