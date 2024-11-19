*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${URL}    https://bugbank.netlify.app/

*** Test Cases ***
Cadastro de Novo Usuário
    [Tags]    Cadastro 
    Given the user access the page
    When he clicks "registrar" button
    And insert the email "VitorQAtest@gmail.com"
    And insert the name "Vitor'a!b@c#d$e%f¨g&h*i\z´f-t^ºçmª+g."
    And insert the password "test1234"
    And insert the password confirmation "test1234"
    And toggle to create account with balance
    And he clicks "cadastrar" buttton
    Then a message containing "nome invalido" should be displayed for Usuário

*** Keywords ***
the user access the page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

he clicks "registrar" button
    Wait Until Element Is Visible    xpath=//button[text()="Registrar"]    timeout=5
    Click Element    xpath=//button[text()="Registrar"]

insert the email "${EMAIL}"
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[2]/input    timeout=5
    Input Text    xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[2]/input    ${EMAIL}

insert the name "${NAME}"
    Input Text    xpath=//input[@name='name']    ${NAME}

insert the password "${PASSWORD}"
    Input Text    xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[4]/div/input    ${PASSWORD}

insert the password confirmation "${PASSWORD}"
    Input Text    xpath=//input[@name='passwordConfirmation']    ${PASSWORD}

toggle to create account with balance
    Wait Until Page Contains Element    xpath=//label[@id='toggleAddBalance']    timeout=5
    Sleep    1s
    Click Element    xpath=//label[@id='toggleAddBalance']

he clicks "cadastrar" buttton
    Click Element    xpath=//button[text()="Cadastrar"]

a message containing "${MESSAGE}" should be displayed for Usuário
    Wait Until Element Is Visible    xpath=//p[@id="modalText"]    timeout=5
    ${text}    Get Text    xpath=//p[@id="modalText"]
    Should Contain    ${text}    ${MESSAGE}
    Click Element    xpath=//*[@id="btnCloseModal"]