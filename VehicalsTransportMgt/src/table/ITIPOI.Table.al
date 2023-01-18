table 50009 "ITI POI"
{
    Caption = 'POI';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
        }
        field(8; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(92; County; Text[30])
        {
            Caption = 'County';
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
