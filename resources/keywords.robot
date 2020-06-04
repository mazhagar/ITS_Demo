*** Settings ***
Library             Dialogs
Library             QWeb
Library             String


*** Variables ***
${BROWSER}                  chrome
${USER_ITS}                     cortzuser
${PASS_ITS}                     p0o!0pen

*** Keywords ***
Setup Browser
    Open Browser    about:blank    ${BROWSER}
    
	
End suite
    Close All Browsers
    Sleep    2

Appstate
	[Documentation]    Appstate handler
	[Arguments]        ${state}
	${state}=            Convert To Lowercase    ${state}
	Run Keyword If      '${state}' == 'frontpage'
	...               FrontPage

FrontPage
	GoTo    https://its-stg-itsstore.sparkred.com/
  TypeSecret      email           ${USER_ITS}
	TypeSecret      Password        ${PASS_ITS}
