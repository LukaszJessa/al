/// <summary>
/// Reads the RichTextBlob value into a stream and outputs the value as a text representation.
/// </summary>
/// <returns>A text value, which can be used with a Rich Text Editor.</returns>
tableextension 80005 "LJA Contact" extends Contact
{
    fields
    {
        field(80000; "LJA RichText Content"; Blob)
        {
            Caption = 'LJA RichText Content';
            DataClassification = ToBeClassified;
        }
    }

    /// <summary>
    /// Reads the RichTextBlob value into a stream and outputs the value as a text representation.
    /// </summary>
    /// <returns>A text value, which can be used with a Rich Text Editor.</returns>
    procedure GetRichText(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        Rec.CalcFields(Rec."LJA RichText Content");
        Rec."LJA RichText Content".CreateInStream(InStream);
        InStream.ReadText(TextValue);

        exit(TextValue);
    end;

    // 
    /// <summary>
    /// Saves the text parameter in the RichTextBlob field.
    /// </summary>
    /// <param name="MyRichText">The value to save in blob field.</param>
    procedure SaveRichText(RichText: Text)
    var
        OutStream: OutStream;
    begin
        Rec."LJA RichText Content".CreateOutStream(OutStream);
        OutStream.WriteText(RichText);
        Rec.Modify();
    end;
}
