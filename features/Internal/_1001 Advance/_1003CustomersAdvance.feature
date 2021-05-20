﻿#language: en
@tree
@Positive
@Advance

Feature: customers advances closing



Background:
	Given I launch TestClient opening script or connect the existing one

	

Scenario: _1003000 preparation (customers advances closing)
	When set True value to the constant
	And I close TestClient session
	Given I open new TestClient session or connect the existing one
	* Load info
		When Create information register Barcodes records
		When Create catalog Companies objects (own Second company)
		When Create catalog CashAccounts objects
		When Create catalog Agreements objects
		When Create catalog ObjectStatuses objects
		When Create catalog ItemKeys objects
		When Create catalog ItemTypes objects
		When Create catalog Units objects
		When Create catalog Items objects
		When Create catalog PriceTypes objects
		When Create catalog Specifications objects
		When Create chart of characteristic types AddAttributeAndProperty objects
		When Create catalog AddAttributeAndPropertySets objects
		When Create catalog AddAttributeAndPropertyValues objects
		When Create catalog Currencies objects
		When Create catalog Companies objects (Main company)
		When Create catalog Stores objects
		When Create catalog Partners objects
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog PartnerSegments objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog TaxRates objects
		When Create catalog Taxes objects	
		When Create information register TaxSettings records
		When Create information register PricesByItemKeys records
		When Create catalog BusinessUnits objects
		When Create catalog ExpenseAndRevenueTypes objects
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		When update ItemKeys
	* Add plugin for taxes calculation
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "TaxCalculateVAT_TR" |
			When add Plugin for tax calculation
		When Create information register Taxes records (VAT)
	* Tax settings
		When filling in Tax settings for company
	* Load documents
		When Create document BankReceipt objects (advance)
		When Create document BankReceipt objects (advance, BR-SI)
		And I execute 1C:Enterprise script at server
			| "Documents.BankReceipt.FindByNumber(4).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.BankReceipt.FindByNumber(5).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.BankReceipt.FindByNumber(6).GetObject().Write(DocumentWriteMode.Posting);" |	
			| "Documents.BankReceipt.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |	
		When Create document CashReceipt objects (advance)
		And I execute 1C:Enterprise script at server
			| "Documents.CashReceipt.FindByNumber(4).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashReceipt.FindByNumber(5).GetObject().Write(DocumentWriteMode.Posting);"  |
		* Load SO
		When Create document SalesOrder objects (check movements, SC before SI, Use shipment sheduling)
		When Create document SalesOrder objects (check movements, SC before SI, not Use shipment sheduling)
		When Create document SalesOrder objects (check movements, SI before SC, not Use shipment sheduling)
		And I execute 1C:Enterprise script at server
				| "Documents.SalesOrder.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |	
				| "Documents.SalesOrder.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
				| "Documents.SalesOrder.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |	
		* Load SC
		When Create document ShipmentConfirmation objects (check movements)
		And I execute 1C:Enterprise script at server
 			| "Documents.ShipmentConfirmation.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.ShipmentConfirmation.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.ShipmentConfirmation.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.ShipmentConfirmation.FindByNumber(8).GetObject().Write(DocumentWriteMode.Posting);" |
		* Load SI
		When Create document SalesInvoice objects (check movements)
		And I execute 1C:Enterprise script at server
 			| "Documents.SalesInvoice.FindByNumber(1).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(2).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(4).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(5).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(8).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(9).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(6).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document BankReceipt objects (advance, customers)
		And I execute 1C:Enterprise script at server
			| "Documents.BankReceipt.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.BankReceipt.FindByNumber(13).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document CashReceipt objects (advance, customers)
		And I execute 1C:Enterprise script at server
			| "Documents.CashReceipt.FindByNumber(6).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CashReceipt.FindByNumber(7).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document CreditNote objects (advance, customers)
		And I execute 1C:Enterprise script at server
			| "Documents.CreditNote.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document DebitNote objects (advance, customers)
		And I execute 1C:Enterprise script at server
			| "Documents.DebitNote.FindByNumber(22).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document SalesReturn objects (advance, customers)
		And I execute 1C:Enterprise script at server
			| "Documents.CreditNote.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document SalesInvoice objects (advance, customers)
		And I execute 1C:Enterprise script at server
 			| "Documents.SalesInvoice.FindByNumber(10).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(11).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(13).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(14).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.SalesInvoice.FindByNumber(15).GetObject().Write(DocumentWriteMode.Posting);" |
		When Create document CustomersAdvancesClosing objects
		And I execute 1C:Enterprise script at server
			| "Documents.CustomersAdvancesClosing.FindByNumber(3).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.CustomersAdvancesClosing.FindByNumber(4).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.CustomersAdvancesClosing.FindByNumber(5).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.CustomersAdvancesClosing.FindByNumber(6).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.CustomersAdvancesClosing.FindByNumber(9).GetObject().Write(DocumentWriteMode.Posting);"  |
			| "Documents.CustomersAdvancesClosing.FindByNumber(10).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CustomersAdvancesClosing.FindByNumber(11).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CustomersAdvancesClosing.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CustomersAdvancesClosing.FindByNumber(13).GetObject().Write(DocumentWriteMode.Posting);" |
			| "Documents.CustomersAdvancesClosing.FindByNumber(14).GetObject().Write(DocumentWriteMode.Posting);" |
		And I close all client application windows
		



Scenario: _1003002 create CustomersAdvancesClosing
	Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
	And I click the button named "FormCreate"
	And I input "12.01.2021 12:00:00" text in "Date" field
	And I click Select button of "Company" field
	And I go to line in "List" table
		| 'Description'  |
		| 'Main Company' |
	And I select current line in "List" table
	And I click Select button of "Begin of period" field
	And I input "12.01.2021" text in "Begin of period" field
	And I input "12.01.2021" text in "End of period" field
	And I click the button named "FormPost"
	And I delete "$$NumberCustomersAdvancesClosing12012021$$" variable
	And I delete "$CustomersAdvancesClosing12012021$$" variable
	And I delete "$$DateCustomersAdvancesClosing11022021$$" variable
	And I save the value of "Number" field as "$$NumberCustomersAdvancesClosing12012021$$"
	And I save the window as "$$CustomersAdvancesClosing12012021$$"
	And I save the value of the field named "Date" as "$$DateCustomersAdvancesClosing12012021$$"
	And I click "Post and close" button
	And I click the button named "FormCreate"
	And I input "27.01.2021 12:00:00" text in "Date" field
	And I click Select button of "Company" field
	And I go to line in "List" table
		| 'Description'  |
		| 'Main Company' |
	And I select current line in "List" table
	And I click Select button of "Begin of period" field
	And I input "27.01.2021" text in "Begin of period" field
	And I input "27.01.2021" text in "End of period" field
	And I click the button named "FormPost"
	And I delete "$$NumberCustomersAdvancesClosing27012021$$" variable
	And I delete "$CustomersAdvancesClosing27012021$$" variable
	And I delete "$$DateCustomersAdvancesClosing27012021$$" variable
	And I save the value of "Number" field as "$$NumberCustomersAdvancesClosing27012021$$"
	And I save the window as "$$CustomersAdvancesClosing27012021$$"
	And I save the value of the field named "Date" as "$$DateCustomersAdvancesClosing27012021$$"
	And I click "Post and close" button
	* Check creation
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And "List" table contains lines
			| 'Number'                                   | 'Date'                | 'Company'      | 'Begin of period' | 'End of period' |
			| '$$NumberCustomersAdvancesClosing12012021$$' | '12.01.2021 12:00:00' | 'Main Company' | '12.01.2021'      | '12.01.2021'    |
			| '$$NumberCustomersAdvancesClosing27012021$$' | '27.01.2021 12:00:00' | 'Main Company' | '27.01.2021'      | '27.01.2021'    |
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"		
		And I close all client application windows
		
	

Scenario: _1003003 check SI closing by advance (Ap-Ar by documents, payment first)
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'   | 'Amount'    | 'Multi currency movement type' | 'Legal name'        | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '670,08'    | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00'  | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00'  | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '667,68'    | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00'  | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:49:39' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '5 890,00'  | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '28.01.2021 18:49:39' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '5 890,00'  | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '28.01.2021 18:49:39' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '1 008,37'  | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '28.01.2021 18:49:39' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '5 890,00'  | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '28.01.2021 18:50:57' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '19 874,00' | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'No'                   |
		| '28.01.2021 18:50:57' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '19 874,00' | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'No'                   |
		| '28.01.2021 18:50:57' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 402,43'  | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'No'                   |
		| '28.01.2021 18:50:57' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '19 874,00' | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 3 dated 28.01.2021 18:50:57' | 'No'                   |
		| '18.02.2021 10:48:46' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '13 000,00' | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'No'                   |
		| '18.02.2021 10:48:46' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '13 000,00' | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'No'                   |
		| '18.02.2021 10:48:46' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '2 225,60'  | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'No'                   |
		| '18.02.2021 10:48:46' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '13 000,00' | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 8 dated 18.02.2021 10:48:46' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '14,00'     | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '2,40'      | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '14,00'     | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '986,00'    | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '168,80'    | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '986,00'    | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '14,00'     | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '986,00'    | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '1 000,00'  | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '171,20'    | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '1 000,00'  | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '1 000,00'  | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 2 dated 28.01.2021 18:49:39' | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '670,08'    | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 914,00'  | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'   | 'Amount'   | 'Multi currency movement type' | 'Legal name'        | 'Basis'                                    | 'Deferred calculation' |
		| '27.01.2021 19:50:47' | 'Cash receipt 6 dated 27.01.2021 19:50:47'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 900,00' | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '27.01.2021 19:50:47' | 'Cash receipt 6 dated 27.01.2021 19:50:47'  | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '667,68'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '27.01.2021 19:50:47' | 'Cash receipt 6 dated 27.01.2021 19:50:47'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '3 900,00' | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '667,68'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 6 dated 27.01.2021 19:50:47' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '1 000,00' | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '171,20'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '1 000,00' | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '14,00'    | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '2,40'     | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '986,00'   | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '168,80'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '14,00'    | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:31:10' | 'Cash receipt 4 dated 27.04.2021 11:31:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '986,00'   | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 4 dated 27.04.2021 11:31:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '1 000,00' | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'USD'      | ''                                                       | 'Main Company' | 'Ferron BP' | '171,20'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | ''                                                       | 'Main Company' | 'Ferron BP' | '1 000,00' | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '1 000,00' | 'Local currency'               | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'USD'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '171,20'   | 'Reporting currency'           | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
		| '27.04.2021 11:32:10' | 'Cash receipt 5 dated 27.04.2021 11:32:10'  | 'TRY'      | 'Customers advances closing 5 dated 27.04.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '1 000,00' | 'en description is empty'      | 'Company Ferron BP' | 'Cash receipt 5 dated 27.04.2021 11:32:10' | 'No'                   |
	And I close all client application windows
	

Scenario: _1003004 check SI movements when unpost document and post it back (closing by advance)
	* Check movements
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '1'    |
		And I click "Registrations report" button
		And I select "R2021 Customer transactions" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Sales invoice 1 dated 28.01.2021 18:48:53' | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| 'Document registrations records'            | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| 'Register  "R2021 Customer transactions"'   | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| ''                                          | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'   | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | 'Attributes'           | ''                                                       |
			| ''                                          | ''            | ''                    | 'Amount'    | 'Company'      | 'Multi currency movement type' | 'Currency' | 'Legal name'        | 'Partner'   | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' | 'Customers advances closing'                             |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '670,08'    | 'Main Company' | 'Reporting currency'           | 'USD'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'Local currency'               | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'TRY'                          | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'en description is empty'      | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '667,68'    | 'Main Company' | 'Reporting currency'           | 'USD'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'Local currency'               | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'TRY'                          | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'en description is empty'      | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close all client application windows
	* Unpost SI
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '1'    |
		And in the table "List" I click the button named "ListContextMenuUndoPosting"
		And I click "Registrations report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Sales invoice 1 dated 28.01.2021 18:48:53' |
			| 'Document registrations records'                 |
		And I close all client application windows
	* Post SI back and check it movements
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '1'    |
		And in the table "List" I click the button named "ListContextMenuPost"
		And I click "Registrations report" button
		And I select "R2021 Customer transactions" exact value from "Register" drop-down list
		And I click "Generate report" button
		Then "ResultTable" spreadsheet document is equal
			| 'Sales invoice 1 dated 28.01.2021 18:48:53' | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| 'Document registrations records'            | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| 'Register  "R2021 Customer transactions"'   | ''            | ''                    | ''          | ''             | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | ''                     | ''                                                       |
			| ''                                          | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'   | ''                             | ''         | ''                  | ''          | ''                         | ''                                          | 'Attributes'           | ''                                                       |
			| ''                                          | ''            | ''                    | 'Amount'    | 'Company'      | 'Multi currency movement type' | 'Currency' | 'Legal name'        | 'Partner'   | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' | 'Customers advances closing'                             |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '670,08'    | 'Main Company' | 'Reporting currency'           | 'USD'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'Local currency'               | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'TRY'                          | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Receipt'     | '28.01.2021 18:48:53' | '3 914'     | 'Main Company' | 'en description is empty'      | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | ''                                                       |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '667,68'    | 'Main Company' | 'Reporting currency'           | 'USD'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'Local currency'               | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'TRY'                          | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
			| ''                                          | 'Expense'     | '28.01.2021 18:48:53' | '3 900'     | 'Main Company' | 'en description is empty'      | 'TRY'      | 'Company Ferron BP' | 'Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   | 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close all client application windows

// Scenario: _1003008 check SI closing by advance (Ap-Ar by partner term, payment first) - DFC
// 	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
// 	And "List" table contains lines
// 		| 'Period'              | 'Recorder'                                       | 'Line number' | 'Currency' | 'Company'      | 'Partner' | 'Amount' | 'Multi currency movement type' | 'Legal name' | 'Agreement'                   | 'Basis' | 'Deferred calculation' | 'Customers advances closing'                             |
// 		| '12.02.2021 15:00:00' | 'Cash payment 21 dated 12.02.2021 15:00:00'      | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '100,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:00:00' | 'Cash payment 21 dated 12.02.2021 15:00:00'      | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '100,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:00:00' | 'Cash payment 21 dated 12.02.2021 15:00:00'      | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '17,12'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:00:00' | 'Cash payment 21 dated 12.02.2021 15:00:00'      | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '100,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:40:00' | 'Purchase invoice 120 dated 12.02.2021 15:40:00' | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '170,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:40:00' | 'Purchase invoice 120 dated 12.02.2021 15:40:00' | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '170,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:40:00' | 'Purchase invoice 120 dated 12.02.2021 15:40:00' | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '29,10'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '12.02.2021 15:40:00' | 'Purchase invoice 120 dated 12.02.2021 15:40:00' | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '170,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 12:00:01' | 'Purchase invoice 122 dated 15.03.2021 12:00:01' | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '110,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 12:00:01' | 'Purchase invoice 122 dated 15.03.2021 12:00:01' | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '110,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 12:00:01' | 'Purchase invoice 122 dated 15.03.2021 12:00:01' | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '18,83'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 12:00:01' | 'Purchase invoice 122 dated 15.03.2021 12:00:01' | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '110,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 19:00:00' | 'Purchase invoice 123 dated 15.03.2021 19:00:00' | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '190,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 19:00:00' | 'Purchase invoice 123 dated 15.03.2021 19:00:00' | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '190,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 19:00:00' | 'Purchase invoice 123 dated 15.03.2021 19:00:00' | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '32,53'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '15.03.2021 19:00:00' | 'Purchase invoice 123 dated 15.03.2021 19:00:00' | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '190,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '2'           | 'USD'      | 'Main Company' | 'DFC'     | '13,70'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '3'           | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '5'           | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '6'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '7'           | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '8'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '5'           | 'TRY'      | 'Main Company' | 'DFC'     | '90,00'  | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '6'           | 'USD'      | 'Main Company' | 'DFC'     | '15,41'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '7'           | 'TRY'      | 'Main Company' | 'DFC'     | '90,00'  | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '14'          | 'TRY'      | 'Main Company' | 'DFC'     | '90,00'  | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '5'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '6'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '7'           | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '8'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 21:50:00' | 'Debit note 21 dated 28.04.2021 21:50:00'        | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '-90,00' | 'TRY'                          | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 21:50:00' | 'Debit note 21 dated 28.04.2021 21:50:00'        | '2'           | 'TRY'      | 'Main Company' | 'DFC'     | '-90,00' | 'Local currency'               | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 21:50:00' | 'Debit note 21 dated 28.04.2021 21:50:00'        | '3'           | 'USD'      | 'Main Company' | 'DFC'     | '-15,41' | 'Reporting currency'           | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 		| '28.04.2021 21:50:00' | 'Debit note 21 dated 28.04.2021 21:50:00'        | '4'           | 'TRY'      | 'Main Company' | 'DFC'     | '-90,00' | 'en description is empty'      | 'DFC'        | 'DFC Vendor by Partner terms' | ''      | 'No'                   | ''                                                     |
// 	Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
// 	And "List" table contains lines
// 		| 'Period'              | 'Recorder'                                       | 'Line number' | 'Currency' | 'Company'      | 'Partner' | 'Amount' | 'Multi currency movement type' | 'Legal name' | 'Basis'                                     | 'Deferred calculation' | 'Customers advances closing'                             |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '3'           | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'Local currency'               | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '4'           | 'USD'      | 'Main Company' | 'DFC'     | '13,70'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '7'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '8'           | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '10'          | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'en description is empty'      | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '12'          | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '13'          | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'Local currency'               | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '14'          | 'USD'      | 'Main Company' | 'DFC'     | '13,70'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '15'          | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '16'          | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '17'          | 'TRY'      | 'Main Company' | 'DFC'     | '80,00'  | 'en description is empty'      | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:38:07' | 'Bank payment 12 dated 28.04.2021 16:38:07'      | '18'          | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'Bank payment 12 dated 28.04.2021 16:38:07' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '5'           | 'TRY'      | 'Main Company' | 'DFC'     | '300,00' | 'Local currency'               | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '6'           | 'USD'      | 'Main Company' | 'DFC'     | '51,36'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '11'          | 'TRY'      | 'Main Company' | 'DFC'     | '300,00' | 'en description is empty'      | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | ''                                                     |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '13'          | 'TRY'      | 'Main Company' | 'DFC'     | '90,00'  | 'Local currency'               | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '14'          | 'USD'      | 'Main Company' | 'DFC'     | '15,41'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:12' | 'Bank payment 15 dated 28.04.2021 16:40:12'      | '19'          | 'TRY'      | 'Main Company' | 'DFC'     | '90,00'  | 'en description is empty'      | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '1'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'Local currency'               | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '2'           | 'USD'      | 'Main Company' | 'DFC'     | '34,24'  | 'Reporting currency'           | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 		| '28.04.2021 16:40:13' | 'Purchase invoice 124 dated 28.04.2021 16:40:13' | '3'           | 'TRY'      | 'Main Company' | 'DFC'     | '200,00' | 'en description is empty'      | 'DFC'        | 'Bank payment 15 dated 28.04.2021 16:40:12' | 'No'                   | 'Customers advances closing 4 dated 28.04.2021 22:00:00' |
// 	And I close all client application windows

	
Scenario: _1003012 check SI closing by advance (Ap-Ar by documents, invoice first)
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
	And "List" table contains lines	
		| 'Period'              | 'Recorder'                                   | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'  | 'Amount'    | 'Multi currency movement type' | 'Legal name'       | 'Agreement'                | 'Basis'                                      | 'Deferred calculation' |
		| '16.02.2021 12:14:54' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		| '17.02.2021 10:33:31' | 'Sales invoice 5 dated 17.02.2021 10:33:31'  | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '26 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 5 dated 17.02.2021 10:33:31'  | 'No'                   |
		| '17.02.2021 10:43:29' | 'Sales invoice 6 dated 17.02.2021 10:43:29'  | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '26 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 6 dated 17.02.2021 10:43:29'  | 'No'                   |
		| '12.04.2021 12:00:01' | 'Sales invoice 15 dated 12.04.2021 12:00:01' | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '20 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 15 dated 12.04.2021 12:00:01' | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '26 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 5 dated 17.02.2021 10:33:31'  | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '16 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 6 dated 17.02.2021 10:43:29'  | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03'  | 'TRY'      | 'Customers advances closing 6 dated 28.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '10 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 6 dated 17.02.2021 10:43:29'  | 'No'                   |
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'  | 'Amount'    | 'Multi currency movement type' | 'Legal name'       | 'Basis'                                     | 'Deferred calculation' |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '54 800,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '26 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '16 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 5 dated 15.04.2021 10:21:22'  | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'TRY'      | ''                                                       | 'Main Company' | 'Lomaniti' | '10 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'No'                   |
		| '28.04.2021 21:50:03' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'TRY'      | 'Customers advances closing 6 dated 28.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '10 000,00' | 'en description is empty'      | 'Company Lomaniti' | 'Bank receipt 13 dated 28.04.2021 21:50:03' | 'No'                   |
	And I close all client application windows
	
	
Scenario: _1003014 check PI closing by advance (Ap-Ar by partner term, invoice first)
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
	And "List" table contains lines	
		| 'Period'              | 'Recorder'                                   | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'         | 'Amount'   | 'Multi currency movement type' | 'Legal name'      | 'Agreement'                | 'Basis' | 'Deferred calculation' |
		| '28.01.2021 18:52:07' | 'Sales invoice 12 dated 28.01.2021 18:52:07' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '1 000,00' | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '28.01.2021 18:52:07' | 'Sales invoice 12 dated 28.01.2021 18:52:07' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '1 000,00' | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '28.01.2021 18:52:07' | 'Sales invoice 12 dated 28.01.2021 18:52:07' | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '171,20'   | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '28.01.2021 18:52:07' | 'Sales invoice 12 dated 28.01.2021 18:52:07' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '1 000,00' | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 00:00:00' | 'Credit note 12 dated 16.02.2021 00:00:00'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '-900,00'  | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 00:00:00' | 'Credit note 12 dated 16.02.2021 00:00:00'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '-900,00'  | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 00:00:00' | 'Credit note 12 dated 16.02.2021 00:00:00'   | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '-154,08'  | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 00:00:00' | 'Credit note 12 dated 16.02.2021 00:00:00'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '-900,00'  | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 12:14:53' | 'Sales invoice 13 dated 16.02.2021 12:14:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '2 000,00' | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 12:14:53' | 'Sales invoice 13 dated 16.02.2021 12:14:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '2 000,00' | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 12:14:53' | 'Sales invoice 13 dated 16.02.2021 12:14:53' | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '342,40'   | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '16.02.2021 12:14:53' | 'Sales invoice 13 dated 16.02.2021 12:14:53' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '2 000,00' | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '800,00'   | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '800,00'   | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '136,96'   | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '800,00'   | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'USD'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '34,24'    | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06'   | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '14.05.2021 10:35:27' | 'Debit note 22 dated 14.05.2021 10:35:27'    | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'TRY'                          | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '14.05.2021 10:35:27' | 'Debit note 22 dated 14.05.2021 10:35:27'    | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'Local currency'               | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '14.05.2021 10:35:27' | 'Debit note 22 dated 14.05.2021 10:35:27'    | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '34,24'    | 'Reporting currency'           | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
		| '14.05.2021 10:35:27' | 'Debit note 22 dated 14.05.2021 10:35:27'    | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '200,00'   | 'en description is empty'      | 'Company Kalipso' | 'Partner Kalipso Customer' | ''      | 'No'                   |
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                 | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'         | 'Amount' | 'Multi currency movement type' | 'Legal name'      | 'Basis'                                    | 'Deferred calculation' |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '200,00' | 'Local currency'               | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'USD'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '34,24'  | 'Reporting currency'           | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'TRY'      | ''                                                       | 'Main Company' | 'Partner Kalipso' | '200,00' | 'en description is empty'      | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '200,00' | 'Local currency'               | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'USD'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '34,24'  | 'Reporting currency'           | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
		| '15.04.2021 14:53:06' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Partner Kalipso' | '200,00' | 'en description is empty'      | 'Company Kalipso' | 'Cash receipt 7 dated 15.04.2021 14:53:06' | 'No'                   |
	And I close all client application windows


Scenario: _1003050 check ignore advance in the SI when post CustomersAdvancesClosing (invoice first)
	And I close all client application windows
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                 | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'  | 'Amount'    | 'Multi currency movement type' | 'Legal name'       | 'Agreement'                | 'Basis'                                      | 'Deferred calculation' |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'Local currency'               | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'USD'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '2 122,88'  | 'Reporting currency'           | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'TRY'                          | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
	And I close current window
	* Set checkbox "Ignore advances"
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '14'    |
		And I select current line in "List" table
		And I move to "Other" tab
		And I move to "More" tab
		And I set checkbox "Ignore advances"
		And I click "Post and close" button
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And I go to line in "List" table
			| 'Number' |
			| '3'      |
		And in the table "List" I click the button named "ListContextMenuPost"
	* Check Customers advances closing
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
		And "List" table does not contain lines
			| 'Period'              | 'Recorder'                                 | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'  | 'Amount'    | 'Multi currency movement type' | 'Legal name'       | 'Agreement'                | 'Basis'                                      | 'Deferred calculation' |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'Local currency'               | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'USD'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '2 122,88'  | 'Reporting currency'           | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'TRY'                          | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		And I close current window
	* Remove checkbox "Ignore advances"	
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '14'    |
		And I select current line in "List" table
		And I move to "Other" tab
		And I move to "More" tab
		And I remove checkbox "Ignore advances"
		And I click "Post and close" button
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And I go to line in "List" table
			| 'Number' |
			| '3'      |
		And in the table "List" I click the button named "ListContextMenuPost"
	* Check Customers advances closing
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"	
		And "List" table contains lines
			| 'Period'              | 'Recorder'                                 | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'  | 'Amount'    | 'Multi currency movement type' | 'Legal name'       | 'Agreement'                | 'Basis'                                      | 'Deferred calculation' |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'Local currency'               | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'USD'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '2 122,88'  | 'Reporting currency'           | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'TRY'                          | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
			| '15.04.2021 10:21:22' | 'Bank receipt 5 dated 15.04.2021 10:21:22' | 'TRY'      | 'Customers advances closing 3 dated 15.04.2021 12:00:00' | 'Main Company' | 'Lomaniti' | '12 400,00' | 'en description is empty'      | 'Company Lomaniti' | 'Basic Partner terms, TRY' | 'Sales invoice 14 dated 16.02.2021 12:14:54' | 'No'                   |
		And I close all client application windows



Scenario: _1003051 check ignore advance in the SI when post CustomersAdvancesClosing (payment first)
	And I close all client application windows
	Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
	And "List" table contains lines
		| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'   | 'Amount'   | 'Multi currency movement type' | 'Legal name'        | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '667,68'   | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
	And I close current window
	* Set checkbox "Ignore advances"
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '1'    |
		And I select current line in "List" table
		And I move to "Other" tab
		And I move to "More" tab
		And I set checkbox "Ignore advances"
		And I click "Post and close" button
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And I go to line in "List" table
			| 'Number' |
			| '9'      |
		And in the table "List" I click the button named "ListContextMenuPost"
	* Check Customers advances closing
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
		And "List" table does not contain lines
			| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'   | 'Amount'   | 'Multi currency movement type' | 'Legal name'        | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '667,68'   | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		And I close current window
	* Remove checkbox "Ignore advances"	
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I go to line in "List" table
			| 'Number' |
			| '1'    |
		And I select current line in "List" table
		And I move to "Other" tab
		And I move to "More" tab
		And I remove checkbox "Ignore advances"
		And I click "Post and close" button
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And I go to line in "List" table
			| 'Number' |
			| '9'      |
		And in the table "List" I click the button named "ListContextMenuPost"
	* Check Customers advances closing
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"	
		And "List" table contains lines
			| 'Period'              | 'Recorder'                                  | 'Currency' | 'Customers advances closing'                             | 'Company'      | 'Partner'   | 'Amount'   | 'Multi currency movement type' | 'Legal name'        | 'Agreement'                | 'Basis'                                     | 'Deferred calculation' |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'TRY'                          | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'Local currency'               | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'USD'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '667,68'   | 'Reporting currency'           | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
			| '28.01.2021 18:48:53' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'TRY'      | 'Customers advances closing 9 dated 28.01.2021 12:00:00' | 'Main Company' | 'Ferron BP' | '3 900,00' | 'en description is empty'      | 'Company Ferron BP' | 'Basic Partner terms, TRY' | 'Sales invoice 1 dated 28.01.2021 18:48:53' | 'No'                   |
		And I close all client application windows
		

Scenario: _1003052 check CustomersAdvancesClosing movements when unpost document and post it back
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
	And I go to line in "List" table
		| 'Number' |
		| '9'      |
	* Unpost
		And in the table "List" I click the button named "ListContextMenuUndoPosting"
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
		And "List" table does not contain lines
			| 'Customers advances closing'                             |
			| 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close current window
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
		And "List" table does not contain lines
			| 'Customers advances closing'                             |
			| 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close current window
	* Post CustomersAdvancesClosing
		Given I open hyperlink "e1cib/list/Document.CustomersAdvancesClosing"
		And I go to line in "List" table
			| 'Number' |
			| '9'      |
		And in the table "List" I click the button named "ListContextMenuPost"
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2020B_AdvancesFromCustomers"
		And "List" table contains lines
			| 'Customers advances closing'                             |
			| 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close current window
		Given I open hyperlink "e1cib/list/AccumulationRegister.R2021B_CustomersTransactions"
		And "List" table contains lines
			| 'Customers advances closing'                             |
			| 'Customers advances closing 9 dated 28.01.2021 12:00:00' |
		And I close all client application windows
		
		
				
	


	
		

	
		
	
	
		



