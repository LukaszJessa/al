page 50002 "ITI Model List"
{
    ApplicationArea = All;
    Caption = 'Models';
    PageType = List;
    SourceTable = "ITI Model";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("MakeCode"; Rec."Make Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
