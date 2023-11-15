pageextension 80010 "LJA Contact Card" extends "Contact Card"
{
    layout
    {
        addafter(General)
        {
            group(LJARIchTextControl)
            {
                field("LJA RichText Content"; RichText)
                {
                    ApplicationArea = All;
                    Caption = 'RichText Content';
                    ExtendedDatatype = RichContent;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the RichText Content field.';

                    trigger OnValidate()
                    begin
                        Rec.SaveRichText(RichText);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        RichText := Rec.GetRichText();
    end;

    var
        RichText: Text;
}
