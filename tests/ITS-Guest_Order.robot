*** Settings ***
Resource            ../resources/keywords.robot
Suite Setup          Setup Browser
Suite Teardown       End suite



*** Test Cases ***

ITS_HomePage
   	[tags]            testgen	nwise=9
	Appstate       	    FrontPage
	ClickText      	    ${Mini_Quick}
	TypeText	quantity	10
	TypeText	skuId		${ItemNumber_Quick}
	ClickText	${AddToCartButton_Quick}
#ITS_ShoppingCartPage	
	#Paypal Checkout
	#ClickElement           //*[@id\="replaced_with_paypal_check_button"]/input[5]
	#TypeText	email	rsivakumar@dss-partners.com
	#ClickText	Next
	#TypeText	password	raviS9840@
	#ClickText	Log in
	#ClickText	Continue
	ClickElement	//*[@id\="cartform"]/div[3]/div[3]/div[3]/div[2]/input[3]
	
#ITS_SecureCheckoutPage
	ClickText           GUEST CHECKOUT
	#ClickText	SHIP TO THIS ADDRESS
	#ClickText	REVIEW ORDER
#ITS_ShippingAddressPage	
	TypeText	First Name	[Test, ITS, Maari, Muthu]
	TypeText	Last Name	[Name, Test, Ravi, Arun]
	TypeText	Email	maaritest1@gmail.com
	# Switch checkbox to off
	ClickCheckbox       I agree         off
	TypeText	shippingAddress_address1		2352 Test Street
	DROPDOWN	shippingAddress_country		United States
	# Verify Country Dropdown
	VerifySelectedOption	shippingAddress_country	United States
	TypeText            City           New York
	DROPDOWN            shippingAddress_state          California
	TypeText           Zip/Postal Code  55632
	ClickCheckbox		shippingAddressAsBilling		on
	VerifyCheckboxValue	shippingAddressAsBilling		on
	TypeText         Telephone        1234567890
	LogScreenshot
	ClickText           CONTINUE
#ITS_PaymentDetailsSection
	VerifyText	Payment Details
	DROPDOWN        billing_creditCartType		masterCard
	#VerifySelectedOption	billing_creditCartType		visa
	TypeText	Card Number	5425233430109903
	TypeText	Name On Card	TestCard
	TypeText	CVV/Security Code	324
	DROPDOWN	billing_expirationDate		06-Jun
	DROPDOWN	billing_expirationYear		2023
	LogScreenshot
	ClickText	REVIEW ORDER
#ITS_ReviewOrderPage
	ClickText	PLACE ORDER
#ITS_ThankyouPage
	VerifyTexts	Thank you for your order!
	${ORDERID}	GetText		Your Order ID is	between=???
	LogScreenshot
