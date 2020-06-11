*** Settings ***
Library             Dialogs
Library             QWeb
Library             String


*** Variables ***
${BROWSER}                  chrome
${USER_ITS}                 cortzuser
${PASS_ITS}                 p0o!0pen
${Mini_Quick}		Quick Order
${QTY_Quick}		10 20 50 100 150 200
${ItemNumber_Quick}	Y1004
${AddToCartButton_Quick}	Add to cart

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
	GoTo    https://cortzuser:p0o!0pen@its-stg-itsstore.sparkred.com/
  	#TypeAlert      Username           ${USER_ITS}
	#TypeAlert      Password        ${PASS_ITS}
	#ClickText	Sign in
