report 50100 "CTP MACRBS Replace URL"
{
    Caption = 'CTP MACRBS Replace URL';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(RecordLink; "Record Link")
        {
            trigger OnPreDataItem()
            begin
                Window.Open('Processing records... @1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                RecordCount := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                RecordCount += 1;
                Window.Update(1, RecordCount);
                if RecordLink.URL1.Contains(OldSubstring) then begin
                    RecordLink.URL1 := RecordLink.URL1.Replace(OldSubstring, NewSubstring);
                    RecordLink.Modify();
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
        Window: Dialog;
        RecordCount: Integer;
}