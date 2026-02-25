pageextension 50100 "CTP Company Information" extends "Company Information"
{
    actions
    {
        addfirst(Processing)
        {
            action(ReplaceURL)
            {
                Caption = 'Replace URL';
                ToolTip = 'Replace a substring in the URL1 field of the Record Link table.';
                Image = Edit;

                trigger OnAction()
                begin
                    Report.Run(50100, true);
                end;
            }
        }
    }
}
