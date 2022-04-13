*** Settings ***
Library       SeleniumLibrary
Resource      ../../CCWEB_Global_Variables.resource
Resource      ../../CCWEB_Global_Keywords.resource

*** Keywords ***
Verify If Item Exists In Cart
    [Arguments]    ${item}
    Wait Until Page Contains                           ${item}