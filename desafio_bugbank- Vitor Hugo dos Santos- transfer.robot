*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${URL}    https://bugbank.netlify.app/

*** Test Cases ***
Cadastro de Novo Usuário 1
    [Tags]    Cadastro 1
    Given the user access the page
    When he clicks "registrar" button
    And insert the email "VitorQAtest@gmail.com"
    And insert the name "VitorQAtest"
    And insert the password "test1234"
    And insert the password confirmation "test1234"
    And toggle to create account with balance
    And he clicks "cadastrar" buttton
    Then a message containing "criada com sucesso" should be displayed for Usuário 1

Cadastro de Novo Usuário 2
    [Tags]    Cadastro 2
    Given the user is at login page
    When he clicks "registrar" button
    And insert the email "VitorQAtest2@gmail.com"
    And insert the name "VitorQAtest2"
    And insert the password "test1234"
    And insert the password confirmation "test1234"
    And toggle to create account with balance
    And he clicks "cadastrar" buttton
    Then a message containing "criada com sucesso" should be displayed for Usuário 2

Login na conta do Usuário 1
    [Tags]    Login
    Given the user is at login page
    And insert the login email "VitorQAtest@gmail.com"
    And insert the login password "test1234"
    And he clicks "acessar" buttton
    Then a message welcoming the user name "VitorQAtest" to the account must be at the page

Transferencia para o Usuário 2
    [Tags]    Transfer
    Given the user is at account page
    And clicks "transferencia" buttton
    And insert the account number "${ACCOUNT_NUMBER_1}"
    And insert the digit "${DIGIT_1}"
    And insert the value "500"
    And insert a description message containing "PIX teste 1"
    And he clicks "Transferir agora" buttton
    Then a message containing "Transferencia realizada com sucesso" should be displayed

*** Keywords ***
the user access the page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

he clicks "registrar" button
    Wait Until Element Is Visible    xpath=//button[text()="Registrar"]    timeout=5
    Click Element    xpath=//button[text()="Registrar"]

insert the email "${EMAIL}"
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

a message containing "${MESSAGE}" should be displayed for Usuário 1
    Wait Until Element Is Visible    xpath=//p[@id="modalText"]    timeout=5
    ${text}    Get Text    xpath=//p[@id="modalText"]
    Should Contain    ${text}    ${MESSAGE}
    Click Element    xpath=//*[@id="btnCloseModal"]
    Reload Page

a message containing "${MESSAGE}" should be displayed for Usuário 2
    Wait Until Element Is Visible    xpath=//p[@id="modalText"]    timeout=5
    ${text}    Get Text    xpath=//p[@id="modalText"]
    Should Contain    ${text}    ${MESSAGE}

    ${values}=    Get Regexp Matches    ${text}    \\d+-\\d
    ${account}=    Convert To List    ${values[0].split("-")}
    ${ACCOUNT_NUMBER_1}=    Set Variable    ${account[0]}
    Set Global Variable    ${ACCOUNT_NUMBER_1}
    ${DIGIT_1}=    Set Variable    ${account[1]}
    Set Global Variable    ${DIGIT_1}

    Click Element    xpath=//*[@id="btnCloseModal"]

the user is at login page
    Wait Until Element Is Visible    xpath=//input[@name='email']    timeout=5

insert the login email "${EMAIL}"
    Input Text    xpath=//input[@name='email']    ${EMAIL}

insert the login password "${PASSWORD}"
    Input Text    xpath=//input[@name='password']    ${PASSWORD}

he clicks "acessar" buttton
    Click Element    xpath=//button[text()="Acessar"]

a message welcoming the user name "${NAME}" to the account must be at the page
    Wait Until Element Is Visible    xpath=//*[@id="textName"]    timeout=5
    ${text}    Get Text    xpath=//*[@id="textName"]
    Should Contain    ${text}    ${NAME}

the user is at account page
    Wait Until Element Is Visible    xpath=//*[@id="btn-TRANSFERÊNCIA"]    timeout=5

clicks "transferencia" buttton
    Click Element    xpath=//*[@id="btn-TRANSFERÊNCIA"]

insert the account number "${ACCOUNT_NUMBER}"
    Wait Until Element Is Visible    xpath=//input[@name='accountNumber']    timeout=5
    Input Text    xpath=//input[@name='accountNumber']    ${ACCOUNT_NUMBER}

insert the digit "${DIGIT}"
    Input Text    xpath=//input[@name='digit']    ${DIGIT}

insert the value "${TRANSFER_VALUE}"
    Input Text    xpath=//input[@name='transferValue']    ${TRANSFER_VALUE}

insert a description message containing "${DESCRIPTION_MESSAGE}"
    Input Text    xpath=//input[@name='description']    ${DESCRIPTION_MESSAGE}

he clicks "Transferir agora" buttton
    Click Element    xpath=//button[text()="Transferir agora"]

a message containing "${MESSAGE}" should be displayed
    Wait Until Element Is Visible    xpath=//*[@id="modalText"]    timeout=5
    ${text}    Get Text    xpath=//*[@id="modalText"]
    Should Contain    ${text}    ${MESSAGE}
    Click Element    xpath=//*[@id="btnCloseModal"]