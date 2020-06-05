*** Settings ***
Resource            ../resources/keywords.robot
Suite Setup          Setup Browser
Suite Teardown       End suite



*** Test Cases ***

ITS_HomePage
   	 [tags]            testgen
	Appstate       	    FrontPage
	ClickText      	    Quick Order
	TypeText	Y1004
	ClickText	Add to cart
ITS_ShoppingCartPage	
	ClickText           CHECK OUT
ITS_SecureCheckoutPage
	ClickText           GUEST CHECKOUT
ITS_ShippingAddressPage	
	TypeText	First Name	[ITS, TestITS, ITStest]
	TypeText	Last Name	[TEST, Name, test]
	TypeText	Email	qentineltest01@mail.com
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
ITS_PaymentDetailsSection
	VerifyText	Payment Details
	DROPDOWN        billing_creditCartType		visa
	#VerifySelectedOption	billing_creditCartType		visa
	TypeText	Card Number	4917484589897107
	TypeText	Name On Card	TestCard
	TypeText	CVV/Security Code	324
	DROPDOWN	billing_expirationDate		06-Jun
	DROPDOWN	billing_expirationYear		2023
	LogScreenshot
	ClickText	REVIEW ORDER
ITS_ReviewOrderPage
	ClickText	PLACE ORDER
ITS_ThankyouPage
	VerifyTexts	Thank you for your order!
	${ORDERID}	GetText		Your Order ID is	between=???
	LogScreenshot
