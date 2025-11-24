*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot

Suite Setup     Setup Browser
Suite Teardown  Close Browser

*** Test Cases ***
Sign Up
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Element    xpath=//button[text()='Sign up']
    Sleep    2
    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Sleep    1s
   
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Wait Until Element is not visible    id=signInModal

Log In
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Element    xpath=//button[text()='Log in']
    # Wait Until Page Contains    Welcome ${USERNAME}
    Sleep    1s

Buy Product
    # Wait Until Page Contains    Welcome ${USERNAME}
    Wait Until Element Is Visible    xpath=//a[text()='Laptops']
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Element Is Visible    xpath=//a[text()='Sony vaio i5']
    Click Element    xpath=//a[text()='Sony vaio i5']
    Wait Until Element Is Visible    xpath=//a[text()='Add to cart']
    Click Element    xpath=//a[text()='Add to cart']
    Handle Alert    accept
    Click Element    id=cartur
    Wait Until Element Is Visible    xpath=//button[text()='Place Order']
    Click Element    xpath=//button[text()='Place Order']
    Wait Until Element Is Visible    id=name    timeout=10s
    Input Text    id=name    Test User
    Input Text    id=country    TestLand
    Input Text    id=city    TestCity
    Input Text    id=card    1234567890123456
    Input Text    id=month    12
    Input Text    id=year    2033
    Click Element    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!
    Sleep   1s
    Click Element    xpath=//button[text()='OK']
    Sleep   1s
    Wait Until Element is not visible    id=orderModal

Log Out
    Wait Until Page Does Not Contain Element    xpath=//div[contains(@class, 'modal') and contains(@style, 'display: block')]
    Sleep    1s
    Wait Until Element Is Visible    id=logout2
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2
