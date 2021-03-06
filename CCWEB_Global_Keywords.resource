*** Settings ***
Library       SeleniumLibrary
Resource      CCWEB_Global_Variables.resource

*** Keywords ***

# GENERAL
Open CC Website   
    Open Browser                     ${url}             ${browser}    options=add_argument("--ignore-certificate-errors")
    Set Window Size                  1920    1080
    Accept Cookies
    Maximize Browser Window
    Wait Until Element Is Visible    ${CCWEB_SearchBar}    5
    
# LOGIN
    
Login To CC Website
    [Arguments]                      ${email}    ${password}    ${username}
    ${wait1}=    Evaluate    random.randint(5, 11)    random
    ${wait2}=    Evaluate    random.randint(5, 11)    random
    ${wait3}=    Evaluate    random.randint(5, 11)    random
    ${wait4}=    Evaluate    random.randint(5, 11)    random
    
    Click Element                    ${CCWEB_LoginLink}
#    Sleep    ${wait1}s
    Input Text                       ${CCWEB_LoginEmail}    ${email}
#    Sleep    ${wait2}s
    Input Password                   ${CCWEB_LoginPassword}    ${password}
#    Sleep    ${wait3}s
    Wait Until Element Is Visible    ${CCWEB_LoginBtn}    ${wait4}s
    # Wait Until Element Is Visible    ${CCWEB_LoginBtn}   
    # Press Keys    ${CCWEB_LoginPassword}    ENTER
    Click Element                    ${CCWEB_LoginBtn}
    Verify If User Is Logged In      ${email}    #used to be username
    
Login To CC Website Invalid
    [Arguments]                      ${email}    ${password}    ${username}
    ${wait1}=    Evaluate    random.randint(5, 11)    random
    ${wait2}=    Evaluate    random.randint(5, 11)    random
    ${wait3}=    Evaluate    random.randint(5, 11)    random
    ${wait4}=    Evaluate    random.randint(5, 11)    random
    Click Element                    ${CCWEB_LoginLink}
#    Sleep    ${wait1}s
    Input Text                       ${CCWEB_LoginEmail}    ${email}
#    Sleep    ${wait2}s
    Input Password                   ${CCWEB_LoginPassword}    ${password}
#   Sleep    ${wait3}s
    Wait Until Element Is Visible    ${CCWEB_LoginBtn}    ${wait4}s
    # Press Keys    ${CCWEB_LoginPassword}    ENTER
    Click Element                    ${CCWEB_LoginBtn}
    
    Wait Until Element Is Visible         ${CCWEB_LoginErrorMessage}    ${wait4}s
    Click Element                    ${CCWEB_LoginErrorMessage}    
    
Verify If User Is Logged In
    [Arguments]                      ${verify_username}
    Wait Until Page Contains         ${verify_username}
    

# SEARCHING/NAVIGATING
    
Search For Item In Search Bar
    [Arguments]                      ${item}
    Wait Until Element Is Visible    ${CCWEB_SearchBar}
    Input Text                       ${CCWEB_SearchBar}    ${item}
    Click Button                     ${CCWEB_SearchBarButton}
    
Navigate Category and Subcategory
    [Arguments]                      ${Category}    ${Subcategory}
    Wait Until Element Is Visible    ${Nav_ShopProducts}
    Click Element                    ${Nav_ShopProducts}
    Click Category                   ${Category}
    Click Subcategory                ${Subcategory}
    
Click Category
    [Arguments]                      ${Selected_Category}
    Mouse Over                       //a[contains(text(),'${Selected_Category}')]
    
Click Subcategory
    [Arguments]                      ${Selected_Subcategory}
    Click Element                    //a[contains(text(),'${Selected_Subcategory}')]
    
Search and View Product Details
    [Arguments]                         ${item}
    Search For Item In Search Bar       ${item}
    Wait Until Element Contains         ${CCWEB_ProductList}    ${item}
    Scroll Element Into View            ${topSearchResult}
    Wait Until Element Is Visible       ${topSearchResult}    10
    Click Element                       ${topSearchResult}
    Wait Until Page Contains            ${item}
    
Click First Item In Search Results
    Wait Until Element Is Visible                      ${ProductList_AddToCart_FirstResult}
    Click Button                                       ${ProductList_AddToCart_FirstResult}
    
Click Continue Shopping
    Wait Until Element Is Visible                      ${CCWEB_ContinueShopping}
    Click Button                                       ${CCWEB_ContinueShopping}
    
Click View Cart
    Wait Until Element Is Visible                      ${Nav_cart}
    Click Element                                      ${Nav_cart}
    
Accept Cookies
    Click Element                    ${CCWEB_AcceptCookies}