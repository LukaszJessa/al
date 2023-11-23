page 80002 "CUK Profiles"
{
    ApplicationArea = All;
    Caption = 'Profiles';
    PageType = List;
    SourceTable = "CUK Profile";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Option Code"; Rec."Option Code")
                {
                    ToolTip = 'Specifies the value of the Option Code field.';
                }
                field("Option Value"; Rec."Option Value")
                {
                    ToolTip = 'Specifies the value of the Option Value field.';
                }
            }
        }
    }
}
