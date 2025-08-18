## Collaboration on open tax data

Join us to build, and explore, a corpus of open data on company tax payments. 

Working with colleagues in the Open Data for Tax Justice network you can:

* **Share** sources of company tax information: with a focus on Country by Country reporting;
* **Extract** data from company reports, creating a common pool of data from disclosures;
* **Transform** data into a common structure, supporting analysis across disclosures;
* **Explore** the resulting data using free and open tools and methods.

### Finding data

At present, the main public source of company tax data comes from published accounts, and in particular, the statutory Country by Country disclosures by particular kinds of companies. 

#### Banks
Banks with operations in the European Union are obliged to publish Country by Country reports under [CRD IV](https://en.wikipedia.org/wiki/Capital_Requirements_Directives). 

#### Extractives companies

In a number of jurisdictions extractives companies are obliged to report on their payments to governments. 

### Extracting and transforming data

Most of the data you will encounter starts out in tables in PDF files. Even when the data is digital, it often needs transforming into a more usable structure. 

With a little bit of configuration, tools like [Tabula](http://tabula.technology/) (self-hosted, free) and [PDFTables](https://pdftables.com/) (hosted service, paid for) can be used to extract tables from many PDFs: saving the work of retyping values.

Members of the OD4TJ network are developing a number of methods to then transform the data to a common form, including:

* A Google Spreadsheet template and scripts (link coming; e-mail tim.davies@opendataservices.coop for latest version)
* A [datapackage pipelines](https://github.com/okfn/datapackage_pipelines_od4tj) workflow.

#### Checklist

When extracting and transforming data, there are a number of important principles

* **Track the provenance**. Maintain a link back to the original source. Keep a copy of the PDF, record the data you accessed it, and the web address where you found it. Users of the data might need to trace back to check it against the source in future. 
* **Don't ignore annotations**. When dealing with accounts, the footnotes and annotations are often very important to interpretation of the data. Try to include these in the data you extract whenever you can.
* **Add context & content in new columns**. When you are cleaning up digitised tables from a PDF, add in new columns for your cleaned data so that you are able to show your working. 
* **Cross-check and verify**. Check the totals, or spot-check data against your original source to be sure everything is accurately transcribed. Catching data errors early saves a lot of time later.


### Suggested data structures

In general, company tax data follows a simple structure, with **information that identifies the company that is reporting**, and **provenance data** on the report that figures are taken from, and a then series of data points recording particular measures for a particular period and, in the case of Country by Country reporting, a particular tax jurdisdiction. 

The section below sets out a series of proposed data elements. These can be thought of as a the column headings, and validation requirements for those columns. 

#### Company information

* legal_name
* alternate_name
* identifier_scheme - taken from [org-id.guide](http://www.org-id.guide )
* identifier - taken from an official register


ToDo: Outline a structure for subsidiary data; identify whether consolidated report can be adequately identified for a company number. 

#### Dimensions

* period_start - YYYY-MM-DD
* period_end - YYYY-MM-DD
* tax_jurisdiction - using an extended version of the ISO Country Code list.


Note: a codelist is required for tax_jurisdiction that clearly defines each jurisdiction.

#### Measures

The following measures are included in the OECD CbC XML schema: 

* revenues_unrelated
* revenues_related
* revenues_total
* profit_or_loss
* tax_paid
* tax_accrued
* capital
* earnings
* number_of_employees
* assets

#### Annotations

Each measure should have space for a descriptive annotation that can be used to capture the deetails of any footnotes of qualifiying statements that should be known about a given measure. 




