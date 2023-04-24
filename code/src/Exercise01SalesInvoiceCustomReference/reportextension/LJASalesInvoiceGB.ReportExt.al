reportextension 80000 "LJA Sales - Invoice GB" extends "Sales - Invoice GB"
{
    // Report Selection - Sales, setup 10572 "Sales - Invoice GB”
    // Report Layout with new RDLC
    RDLCLayout = './rdlc/LJASalesInvoiceGB.rdlc';

    dataset
    {
        add("Sales Invoice Header")
        {
            column(CustomReference; "LJA Custom Reference")
            {
            }
        }
    }
}
