report 50100 "CTP MACRBS Replace URL"
{
    Caption = 'CTP MACRBS Replace URL';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Media Resources"; "Media Resources")
        {
            trigger OnAfterGetRecord()
            begin
                if "Media Resources".URL1.Contains(OldSubstring) then begin
                    "Media Resources".URL1 := "Media Resources".URL1.Replace(OldSubstring, NewSubstring);
                    "Media Resources".Modify();
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(OldSubstring; OldSubstring)
                    {
                        Caption = 'Old Substring';
                        ToolTip = 'The substring to replace in the URL1 field.';
                    }

                    field(NewSubstring; NewSubstring)
                    {
                        Caption = 'New Substring';
                        ToolTip = 'The new substring to use in the URL1 field.';
                    }
                }
            }
        }
    }

    var
        OldSubstring: Text;
        NewSubstring: Text;
}