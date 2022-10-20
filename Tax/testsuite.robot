*** Settings ***
Suite Setup       GoToHomePage
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:8080
${file}           /Users/rongyao.ma/Desktop/workingClassHero.csv

*** Test Cases ***
test_upload_file
    [Tags]    p0    r0
    [Setup]    Log To Console    p0r0 test case started
    Input Text    css=.custom-file-input    ${file}
    [Teardown]    Log To Console    p0r0 test case finished

test_refresh_tax_relief_table
    [Tags]    p1
    [Setup]    Log To Console    p1 test case started
    Click Button    css=.btn-primary
    Should Not Be Empty    Relief
    Should Not Be Empty    NatId
${EMPTY}
    [Teardown]    Log To Console    p1 test case finished

test_visit_swagger
    [Tags]    p2
    [Setup]    Log To Console    p2 test case started
    Click Link    css=.btn-info
    Title Should Be    Swagger UI
    [Teardown]    GoToHomePage    p2 test case finished

test_dispense
    [Tags]    p0
    [Setup]    Log To Console    p0 test case started
    Scroll Element Into View    css=.display-4
    Click Link    css=.btn-block
    Title Should Be    Dispense!!
    ${text}=    Get Text    css=.font-weight-bold
    Should Be Equal    ${text}    Cash dispensed
    [Teardown]    Log To Console    p0 test case finished

*** Keywords ***
GoToHomePage
    Open Browser    ${url}    Chrome
    Maximize Browser Window
