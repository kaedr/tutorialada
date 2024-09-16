
with Ada.Text_IO;

procedure Buffers1.Homework1.Test is
    A_Buffer, B_Buffer : Buffer_Type;
    Extracted_Text : String(1 .. 1024);
begin
    Copy_Into(A_Buffer, "hello, world!");
    Immutable_Sort(Input => A_Buffer, Output => B_Buffer);
    Copy_From(Buffer => B_Buffer, Destination => Extracted_Text, Point => 1, Length => 1024);
    Ada.Text_IO.Put_Line("|" & Extracted_Text & "|");
end;
