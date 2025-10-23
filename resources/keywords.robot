*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com/
${USERNAME}     dfszxcgvhmlkfbbae
${PASSWORD}     4a325dju9ik0

*** Keywords ***
Open DemoBlaze Website
    Open Browser    ${URL}    chrome
    Maximize Browser Window

