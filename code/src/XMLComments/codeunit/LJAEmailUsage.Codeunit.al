codeunit 80014 "LJA Email Usage"
{
    procedure EmailUsage()
    var
        LJAEmail: Codeunit "LJA Email";
    begin
        LJAEmail.Enqueue(CreateGuid());
    end;
}
