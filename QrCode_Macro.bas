Attribute VB_Name = "QrCode"
Sub Insert_QrCodes()
'
' Insert_QrCodes Macro
'
'

Dim objTbl As Table
Dim nRow As Long
Dim img As Long
Dim rg As Range

With ActiveDocument
    
    Dim sBase_Path As String
    sBase_Path = "C:\"

    Dim objFiledialog As FileDialog
    Set objFiledialog = Application.FileDialog(msoFileDialogFilePicker)
    
    objFiledialog.AllowMultiSelect = True
    objFiledialog.ButtonName = "Import Images"
    objFiledialog.Filters.Add "Images Photos", "*.png"
    objFiledialog.Title = "Select the photos.."
    objFiledialog.InitialView = msoFileDialogViewTiles
    objFiledialog.InitialFileName = sBase_Path
    
    If objFiledialog.Show() = False Then
        Exit Sub
    End If

    If objFiledialog.SelectedItems().Count = 0 Then
        Exit Sub
    End If
     
    On Error Resume Next


    If .Tables.Count = 0 Then Exit Sub

    Set objTbl = .Tables(1)
    objTbl.AutoFitBehavior wdAutoFitFixed

    Dim new_Row As Row
    Do Until objTbl.Rows.Count * objTbl.Columns.Count > objFiledialog.SelectedItems.Count
        Set new_Row = objTbl.Rows.Add()
    Loop
    
    img = 0
    For nRow = 1 To objTbl.Rows.Count
        For nCol = 1 To objTbl.Columns.Count
            img = img + 1
            Set rg = objTbl.Cell(Row:=nRow, Column:=nCol).Range
            rg.Collapse wdCollapseStart
            .InlineShapes.AddPicture _
                FileName:=objFiledialog.SelectedItems(img), _
                Range:=rg
        Next nCol
    Next nRow
End With

End Sub
