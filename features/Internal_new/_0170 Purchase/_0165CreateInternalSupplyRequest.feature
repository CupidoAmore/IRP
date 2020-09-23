﻿#language: en
@tree
@Positive
@Group3

Feature: create document an Internal supply request 

As a sales manager
I want to create an Internal supply request 
For ordering items to the planning department (purchasing or transfer from the store)


Background:
	Given I launch TestClient opening script or connect the existing one


Scenario: _016501 preparation
	* Load info
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
		When Create catalog Partners objects (Ferron BP)
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog PartnerSegments objects
		When Create catalog Agreements objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		* Add plugin for taxes calculation
			Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
			If "List" table does not contain lines Then
					| "Description" |
					| "TaxCalculateVAT_TR" |
				* Opening a form to add Plugin sessing
					Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
				* Addition of Plugin sessing for calculating Tax types for Turkey (VAT)
					And I click the button named "FormCreate"
					And I select external file "#workingDir#\DataProcessor\TaxCalculateVAT_TR.epf"
					And I click the button named "FormAddExtDataProc"
					And I input "" text in "Path to plugin for test" field
					And I input "TaxCalculateVAT_TR" text in "Name" field
					And I click Open button of the field named "Description_en"
					And I input "TaxCalculateVAT_TR" text in the field named "Description_en"
					And I input "TaxCalculateVAT_TR" text in the field named "Description_tr"
					And I click "Ok" button
					And I click "Save and close" button
					And I wait "Plugins (create)" window closing in 10 seconds
				* Check added processing
					Then I check for the "ExternalDataProc" catalog element with the "Description_en" "TaxCalculateVAT_TR"
					Given I open hyperlink "e1cib/list/Catalog.Taxes"		
					And I go to line in "List" table
						| 'Description' |
						| 'TaxCalculateVAT_TR'         |
					And I select current line in "List" table
					And I click Select button of "Plugins" field
					And I go to line in "List" table
						| 'Description' |
						| 'VAT'         |
					And I select current line in "List" table
					And I click "Save and close" button
				And I close all client application windows
		* Constants
			When set True value to the constant
			
Scenario: _016501 create document Internal Supply Request
	* Opening the creation form Internal Supply Request
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
	* Filling in the main details of the document
		And I click Select button of "Company" field
		And I activate "Description" field in "List" table
		And I go to line in "List" table
			| Description  |
			| Main Company | 
		And I select current line in "List" table
		And I click Select button of "Store" field
		And I go to line in "List" table
			| Description |
			| Store 01  |
		And I select current line in "List" table
	* Filling in items table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| Description |
			| Trousers    |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| Item     | Item key          |
			| Trousers | 36/Yellow |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "10,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| Description |
			| Shirt       |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "25,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| Description |
			| Shirt       |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| Item  | Item key |
			| Shirt | 38/Black |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "20,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Post document
		And I click "Post" button
		And I save the value of "Number" field as "$$NumberInternalSupplyRequest016501$$"
		And I save the window as "$$InternalSupplyRequest016501$$"
		And I click "Post and close" button
	* Check document creation
		And "List" table contains lines
			| 'Number'                                     | 'Company'      | 'Store'    |
			| '$$NumberInternalSupplyRequest016501$$'      | 'Main Company' | 'Store 01' |
		And I close all client application windows
	* Check posting on the document Internal Supply Request (register OrderBalance)
		Given I open hyperlink "e1cib/list/AccumulationRegister.OrderBalance"
		And "List" table contains lines
			| 'Quantity' | 'Recorder'                        | 'Store'    | 'Order'                           | 'Item key'  |
			| '10,000'   | '$$InternalSupplyRequest016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '36/Yellow' |
			| '25,000'   | '$$InternalSupplyRequest016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '36/Red'    |
			| '20,000'   | '$$InternalSupplyRequest016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '38/Black'  |
		And I close all client application windows
	* Creating an Inventory transfer order document based on an InternalSupplyRequest document
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I go to line in "List" table
			| 'Number'                                | 'Company'      | 'Store'    |
			| '$$NumberInternalSupplyRequest016501$$' | 'Main Company' | 'Store 01' |
		And I click the button named "FormDocumentInventoryTransferOrderGenerateInventoryTransferOrder"
		And I click Select button of "Store sender" field
		And I go to line in "List" table
			| Description |
			| Store 03  |
		And I select current line in "List" table
		And I click Select button of "Company" field
		And I select current line in "List" table
		And I select "Approved" exact value from "Status" drop-down list
		And I go to line in "ItemList" table
			| 'Item'     | 'Item key'          | 'Quantity' | 'Unit' |
			| 'Trousers' | '36/Yellow' | '10,000'   | 'pcs' |
		And I activate "Item" field in "ItemList" table
		And I delete a line in "ItemList" table
		And I click "Post" button
		And I save the value of "Number" field as "$$NumberInventoryTransferOrder016501$$"
		And I save the window as "$$InventoryTransferOrder016501$$"
		And I click "Post and close" button
		And I close all client application windows
	* Check posting of an Inventory transfer order document created based on InternalSupplyRequest
		Given I open hyperlink "e1cib/list/AccumulationRegister.OrderBalance"
		And "List" table contains lines
			| 'Quantity' | 'Recorder'                   | 'Store'    | 'Order'                           | 'Item key' |
			| '25,000'   | '$$InventoryTransferOrder016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '36/Red'   |
			| '20,000'   | '$$InventoryTransferOrder016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '38/Black' |
		And I close all client application windows
		Given I open hyperlink "e1cib/list/AccumulationRegister.StockReservation"
		And "List" table contains lines
			| 'Quantity' | 'Recorder'                   | 'Store'    | 'Item key' |
			| '25,000'   | '$$InventoryTransferOrder016501$$' | 'Store 03' | '36/Red'   |
			| '20,000'   | '$$InventoryTransferOrder016501$$' | 'Store 03' | '38/Black' |
		And I close all client application windows
		Given I open hyperlink "e1cib/list/AccumulationRegister.TransferOrderBalance"
		And "List" table contains lines
			| 'Quantity' | 'Recorder'                   | 'Store sender' | 'Store receiver' | 'Order'                      | 'Item key' |
			| '25,000'   | '$$InventoryTransferOrder016501$$' | 'Store 03'     | 'Store 01'       | '$$InventoryTransferOrder016501$$' | '36/Red'   |
			| '20,000'   | '$$InventoryTransferOrder016501$$' | 'Store 03'     | 'Store 01'       | '$$InventoryTransferOrder016501$$' | '38/Black' |
		And I close all client application windows
	* Create a Purchase order based on the InternalSupplyRequest document
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I go to line in "List" table
			| 'Number'                                | 'Company'      | 'Store'    |
			| '$$NumberInternalSupplyRequest016501$$' | 'Main Company' | 'Store 01' |
		And I click the button named "FormDocumentPurchaseOrderGeneratePurchaseOrder"
		And I select "Approved" exact value from "Status" drop-down list
		Then the form attribute named "Store" became equal to "Store 01"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| Description |
			| Ferron BP   |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I activate "Description" field in "List" table
		And I go to line in "List" table
			| Description       |
			| Company Ferron BP |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| Description        |
			| Vendor Ferron, TRY |
		And I select current line in "List" table
		Then If dialog box is visible I click "No" button
		And I click "OK" button
		And "ItemList" table contains lines
			| 'Item'     | 'Q'        | 'Purchase basis'    | 'Item key'          | 'Store'    | 'Unit' |
			| 'Trousers' | '10,000'   | '$$InternalSupplyRequest016501$$' | '36/Yellow' | 'Store 01' | 'pcs' |
		And I select current line in "ItemList" table
		And I activate "Q" field in "ItemList" table
		And I input "9,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I save number of "ItemList" table lines as "Q1"
		And I display "Q1" variable value
		Then "Q1" variable is equal to 1
		And I click "Post" button
		And I save the value of "Number" field as "$$NumberPurchaseOrder016501$$"
		And I save the window as "$$PurchaseOrder016501$$"
		And I click "Post and close" button
	* Check posting of a Purchase order document created based on InternalSupplyRequest
		Given I open hyperlink "e1cib/list/AccumulationRegister.OrderBalance"
		And "List" table contains lines
			| 'Quantity' | 'Recorder'                | 'Store'    | 'Order'                           | 'Item key'  |
			| '9,000'    | '$$PurchaseOrder016501$$' | 'Store 01' | '$$PurchaseOrder016501$$'         | '36/Yellow' |
			| '9,000'    | '$$PurchaseOrder016501$$' | 'Store 01' | '$$InternalSupplyRequest016501$$' | '36/Yellow' |
		And I close all client application windows
	


Scenario: _016503 check the Company filter in the Internal Supply Request document.
	* Opening the creation form Internal Supply Request
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
	* Check the visual filter by Company
		And I click Select button of "Company" field
		And "List" table became equal
			| Description  |
			| Main Company |
		And I select current line in "List" table
		Then the form attribute named "Company" became equal to "Main Company"
	* Check filter by Company when inpute by string
		And I input "Company Kalipso" text in "Company" field
		And Delay 2
		And I click Select button of "Store" field
		And Delay 2
		Then "Companies" window is opened
		And "List" table does not contain lines
			| Description  |
			| Company Kalipso |
		And I click the button named "FormChoose"
		When I Check the steps for Exception
			|'Then the form attribute named "Company" became equal to "Company Kalipso"'|
		And I close all client application windows
	


Scenario: _016504 check display of the title of the collapsible group when creating the document Internal Supply Request
	* Opening the creation form Internal Supply Request
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
	* Filling in the document number
		And I input "0" text in "Number" field
		Then "1C:Enterprise" window is opened
		And I click "Yes" button
		And I input "215" text in "Number" field
	* Filling in the main details of the document
		And I click Select button of "Company" field
		And I activate "Description" field in "List" table
		And I go to line in "List" table
			| Description  |
			| Main Company | 
		And I select current line in "List" table
		And I click Select button of "Store" field
		And I go to line in "List" table
			| Description |
			| Store 01  |
		And I select current line in "List" table
	* Check display of the title of the collapsible group
		Then the field named "DecorationGroupTitleUncollapsedLabel" value contains "Number: 215   Company: Main Company   Store: Store 01" text
		And I close all client application windows










	



	





