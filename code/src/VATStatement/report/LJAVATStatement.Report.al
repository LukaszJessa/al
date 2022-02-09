report 80000 "LJA VAT Statement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/VATStatement/report/reportlayout/LJAVATStatement.rdl';

    Caption = 'VAT Statement';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number)
                                order(Ascending);
            MaxIteration = 1;
            column(VATStatementCaption; VATStatementTxt)
            {
            }
            column(SourceNoCaption; SourceNoTxt)
            {
            }
            column(SourceNameCaption; SourceNameTxt)
            {
            }
            column(SourceCountryCaption; SourceCountryTxt)
            {
            }
            column(BillToPayToCountryCaption; BillToPayToCountryTxt)
            {
            }
            column(VATRegNoCaption; VATRegNoTxt)
            {
            }
            column(BillToPayToVATRegNoCaption; BillToPayToVATRegNoTxt)
            {
            }
            column(ShipToNoCaption; ShipToNoTxt)
            {
            }
            column(ShipToNameCaption; ShipToNameTxt)
            {
            }
            column(ShipToCountryCaption; ShipToCountryTxt)
            {
            }
            column(ShipmentMethodCodeCaption; ShipmentMethodCodeTxt)
            {
            }
            column(PostingDateCaption; PostingDateTxt)
            {
            }
            column(DocumentDateCaption; DocumentDateTxt)
            {
            }
            column(DocumentNoCaption; DocumentNoTxt)
            {
            }
            column(CurrencyCodeCaption; CurrencyCodeTxt)
            {
            }
            column(TotalAmountFCYCaption; TotalAmountFCYTxt)
            {
            }
            column(VATAmountFCYCaption; VATAmountFCYTxt)
            {
            }
            column(TotalAmountLCYCaption; TotalAmountLCYTxt)
            {
            }
            column(VATAmountLCYCaption; VATAmountLCYTxt)
            {
            }
            column(VATEntryFilter; VATEntry.TableCaption() + ' : ' + VATEntryFilter)
            {
            }
            column(TypeCaption; TypeTxt)
            {
            }
            column(VATBusPostingGroupCaption; VATBusPostingGroupTxt)
            {
            }
            column(VATProdPostingGroupCaption; VATProdPostingGroupTxt)
            {
            }
        }
        dataitem(VATEntry; "VAT Entry")
        {
            RequestFilterFields = "VAT Bus. Posting Group", "VAT Prod. Posting Group", Type, "Posting Date";
            column(BillToPayTo_VATEntry; "Bill-to/Pay-to No.")
            {
            }
            column(BillToPayToName; BillToPayToName)
            {
            }
            column(CountryRegion_VATEntry; "Country/Region Code")
            {
            }
            column(BillToPayToCountryRegion; BillToPayToCountryRegion)
            {
            }
            column(VATRegNo_VATEntry; "VAT Registration No.")
            {
            }
            column(BillToPayToVATRegNo; BillToPayToVATRegNo)
            {
            }
            column(ShipToCode; ShipToCode)
            {
            }
            column(ShipToName; ShipToName)
            {
            }
            column(ShipToCountryRegion; ShipToCountryRegion)
            {
            }
            column(ShipmentMethodCode; ShipmentMethodCode)
            {
            }
            column(PostingDate_VATEntry; "Posting Date")
            {
            }
            column(DocDate_VATEntry; "Document Date")
            {
            }
            column(DocNo_VATEntry; "Document No.")
            {
            }
            column(Base_VATEntry; Base)
            {
            }
            column(Amount_VATEntry; Amount)
            {
            }
            column(Type_VATEntry; Type)
            {
            }
            column(VATBusPostingGroup_VATEntry; "VAT Bus. Posting Group")
            {
            }
            column(VATProdPostingGroup_VATEntry; "VAT Prod. Posting Group")
            {
            }

            trigger OnAfterGetRecord()
            var
                Vendor: Record Vendor;
                SalesInvoiceHeader: Record "Sales Invoice Header";
                PurchInvoiceHeader: Record "Purch. Inv. Header";
            begin
                ClearValues();

                case Type of
                    Type::Sale:
                        if SalesInvoiceHeader.GET("Document No.") then begin
                            ShipToCode := SalesInvoiceHeader."Ship-to Code";
                            ShipToName := SalesInvoiceHeader."Ship-to Name" + ' ' + SalesInvoiceHeader."Ship-to Name 2";
                            ShipToCountryRegion := SalesInvoiceHeader."Ship-to Country/Region Code";
                            ShipmentMethodCode := SalesInvoiceHeader."Shipment Method Code";
                            BillToPayToName := SalesInvoiceHeader."Bill-to Name";
                            BillToPayToCountryRegion := SalesInvoiceHeader."Bill-to Country/Region Code";
                        end;
                    Type::Purchase:
                        begin
                            if Vendor.GET("Bill-to/Pay-to No.") then begin
                                BillToPayToName := Vendor.Name;
                                BillToPayToCountryRegion := Vendor."Country/Region Code";
                                BillToPayToVATRegNo := Vendor."VAT Registration No.";
                            end;
                            if PurchInvoiceHeader.GET("Document No.") then begin
                                ShipToCode := PurchInvoiceHeader."Ship-to Code";
                                ShipToName := PurchInvoiceHeader."Ship-to Name" + ' ' + PurchInvoiceHeader."Ship-to Name 2";
                                ShipToCountryRegion := PurchInvoiceHeader."Ship-to Country/Region Code";
                                ShipmentMethodCode := PurchInvoiceHeader."Shipment Method Code";
                                BillToPayToName := PurchInvoiceHeader."Pay-to Name";
                                BillToPayToCountryRegion := PurchInvoiceHeader."Pay-to Country/Region Code";
                            end;
                        end;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        VATEntryFilter := VATEntry.GetFilters;
    end;

    var
        BillToPayToName: Text[100];
        BillToPayToCountryRegion: Code[10];
        BillToPayToVATRegNo: Code[20];
        ShipToCode: Code[10];
        ShipToName: Text[151];
        ShipToCountryRegion: Code[10];
        ShipmentMethodCode: Code[10];
        VATStatementTxt: Label 'VAT Statement GT';
        SourceNoTxt: Label 'Source No.';
        SourceNameTxt: Label 'Source Name';
        SourceCountryTxt: Label 'Source Country';
        BillToPayToCountryTxt: Label 'Bill-to/Pay-to Country';
        VATRegNoTxt: Label 'VAT Reg. No.';
        BillToPayToVATRegNoTxt: Label 'Bill-to/Pay-to VAT Reg. No.';
        ShipToNoTxt: Label 'Ship-to Code';
        ShipToNameTxt: Label 'Ship-to Name';
        ShipToCountryTxt: Label 'Ship-to Country';
        ShipmentMethodCodeTxt: Label 'Shipment Method Code';
        PostingDateTxt: Label 'Posting Date';
        DocumentDateTxt: Label 'Document Date';
        DocumentNoTxt: Label 'Document No.';
        CurrencyCodeTxt: Label 'Currency Code';
        TotalAmountFCYTxt: Label 'Total Amount FCY';
        VATAmountFCYTxt: Label 'VAT Amount FCY';
        TotalAmountLCYTxt: Label 'Total Amount LCY';
        VATAmountLCYTxt: Label 'VAT Amount LCY';
        VATEntryFilter: Text;
        TypeTxt: Label 'Type';
        VATBusPostingGroupTxt: Label 'VAT Bus. Posting Group';
        VATProdPostingGroupTxt: Label 'VAT Prod. Posting Group';

    procedure ClearValues()
    begin
        BillToPayToName := '';
        BillToPayToCountryRegion := '';
        BillToPayToVATRegNo := '';
        ShipToCode := '';
        ShipToName := '';
        ShipToCountryRegion := '';
        ShipmentMethodCode := '';
    end;
}

