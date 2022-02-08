page 80000 "LJA My Address"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(WhatsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'Whats the Address?';
                ToolTip = 'Select the address.';
                Image = Addresses;

                trigger OnAction()
                var
                    iLJAAddressProvider: Interface "LJA IAddressProvider";
                begin
                    AddressProviderFactory(iLJAAddressProvider);
                    Message(iLJAAddressProvider.GetAddress());
                end;
            }

            action(SendToHome)
            {
                ApplicationArea = All;
                Image = Home;
                Caption = 'Send to Home.';
                ToolTip = 'Set the interface implementation to Home.';
                trigger OnAction()
                begin
                    SendTo := SendTo::Private
                end;
            }

            action(SendToWork)
            {
                Image = WorkCenter;
                Caption = 'Send to Work.';
                ToolTip = 'Set the interface implementation to Work.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    SendTo := SendTo::Company
                end;
            }
        }
    }

    local procedure AddressProviderFactory(var iLJAAddressProvider: Interface "LJA IAddressProvider")
    var
        LJACompanyAddressProvider: Codeunit "LJA Company Address Provider";
        LJAPrivateAddressProvider: Codeunit "LJA Private Address Provider";
    begin

        if SendTo = SendTo::Company then
            iLJAAddressProvider := LJACompanyAddressProvider;

        if SendTo = SendTo::Private then
            iLJAAddressProvider := LJAPrivateAddressProvider;
    end;

    var
        SendTo: enum "LJA Send To";
}
