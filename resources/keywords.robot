*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com/
${USERNAME}     dfszxcgvhmlkfbbae
${PASSWORD}     4a325dju9ik0

${BROWSER}             chrome
${RUN_ENV}             local
${BROWSERSTACK_USER}     bsuser_H3lukh
${BROWSERSTACK_KEY}      okK2WcVVHbeJxoUEFKSQ
${BROWSERSTACK_URL}      https://${BROWSERSTACK_USER}:${BROWSERSTACK_KEY}@hub-cloud.browserstack.com/wd/hub

*** Keywords ***
Setup Browser
    IF    '${RUN_ENV}' == 'browserstack'
        Open Browser On BrowserStack
    ELSE
        Open Browser Locally
    END

Open Browser Locally
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Open Browser On BrowserStack
    ${caps}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${caps}    set_capability    browserName    ${BROWSER}
    Call Method    ${caps}    set_capability    name    Demoblaze Tests
    IF    '${BROWSER}' == 'safari'
        Call Method    ${caps}    set_capability    os    OS X
        Call Method    ${caps}    set_capability    os_version    Sonoma
        Call Method    ${caps}    set_capability    browser_version    17.0
    ELSE
        Call Method    ${caps}    set_capability    os    Windows
        Call Method    ${caps}    set_capability    osVersion    11
    END
    

    Open Browser    ${URL}    remote_url=${BROWSERSTACK_URL}    options=${caps}
    Maximize Browser Window