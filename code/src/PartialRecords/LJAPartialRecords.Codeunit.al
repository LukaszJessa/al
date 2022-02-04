codeunit 80008 "LJA Partial Records"
{
    #region No Partial Records
    procedure NoPartialRecords()
    var
        Customer: Record Customer;
    begin
        if Customer.FindSet() then
            repeat
                if Customer.Blocked = Customer.Blocked::All then;
            until Customer.Next() = 0;
    end;
    #endregion

    #region With Partial Records
    procedure WithPartialRecords()
    var
        Customer: Record Customer;
    begin
        Customer.SetLoadFields(Blocked);
        if Customer.FindSet() then
            repeat
                if Customer.Blocked = Customer.Blocked::All then;
            until Customer.Next() = 0;
    end;
    #endregion

    #region JIT Partial Records
    procedure JITPartialRecords()
    var
        Customer: Record Customer;
    begin
        Customer.SetLoadFields(Blocked);
        if Customer.FindSet() then
            repeat
                if Customer.Blocked = Customer.Blocked::All then
                    if Customer.Address <> '' then;
            until Customer.Next() = 0;
    end;
    #endregion

    #region Avoid JIT Partial Records
    procedure AvoidJITPartialRecords()
    var
        Customer: Record Customer;
    begin
        Customer.SetLoadFields(Blocked, Address);
        if Customer.FindSet() then
            repeat
                if Customer.Blocked = Customer.Blocked::All then
                    if Customer.Address <> '' then;
            until Customer.Next() = 0;
    end;
    #endregion    

    #region Partial Records in extension
    procedure InExtensionPartialRecords()
    var
        Customer: Record Customer;
    begin
        if not Customer.AreFieldsLoaded(Blocked, Address) then
            Customer.AddLoadFields(BLocked, Address);

        if Customer.FindSet() then
            repeat
                if Customer.Blocked = Customer.Blocked::All then
                    if Customer.Address <> '' then;
            until Customer.Next() = 0;
    end;
    #endregion     
}
